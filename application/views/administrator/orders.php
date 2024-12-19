<?php echo $this->session->flashdata('upload'); ?>

<!-- Modal -->
<div class="modal fade" id="checkStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form action="<?php echo base_url() ?>transaction/process" method="POST">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cek Status Pembayaran</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="orderid" col-form-label">Order ID/Invoice</label>
						<input type="text" required class="form-control" name="order_id" id="orderid" autocomplete="off">
					</div>
					<input type="hidden" name="action" value="status">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Proses</button>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Pesanan</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#checkStatus">Status</button>
		</div>
		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<?php echo $this->session->flashdata('status'); ?>
			<?php if ($orders->num_rows() > 0) { ?>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>#</th>
								<th>Kode/Invoice</th>
								<th>Nama</th>
								<th>Total Pesanan</th>
								<th>Tanggal Pesan</th>
								<th>Order Status</th>
								<th>Alasan Cancel</th>
								<th>Pay Status</th>
								<th width='10%'>Aksi</th>
							</tr>
						</thead>
						<tfoot></tfoot>
						<tbody class="data-content">
							<?php $no = $this->uri->segment(3) + 1; ?>
							<?php foreach ($orders->result_array() as $data) : ?>
								<tr>
									<td><?= $no; ?></td>
									<td><?= $data['invoice_code']; ?></td>
									<td><?= $data['name']; ?></td>
									<td>Rp <?= number_format($data['total_all'], 0, ",", "."); ?></td>
									<td><?= $data['date_input']; ?></td>
									<?php if ($data['courier'] == "cod") { ?>
										<?php if ($data['status'] != 4) { ?>
											<td>Cash of Delivery</td>
										<?php } else { ?>
											<td>Selesai</td>
										<?php } ?>
									<?php } else { ?>
										<?php if ($data['status'] == 0) { ?>
											<td>Belum di proses</td>
										<?php } else if ($data['status'] == 1) { ?>
											<td>Belum diproses</td>
										<?php } else if ($data['status'] == 2) { ?>
											<td>Sedang diproses</td>
										<?php } else if ($data['status'] == 3) { ?>
											<td>Sedang dikirim</td>
										<?php } else if ($data['status'] == 4) { ?>
											<td>Selesai</td>
										<?php } else if ($data['status'] == 5) { ?>
											<td>Menunggu Konfirmasi Pembatalan</td>
										<?php } else if ($data['status'] == 6) { ?>
											<td>Pembatalan Telah Dikonfirmasi</td>
										<?php } else if ($data['status'] ==  7) { ?>
											<td>Pembatalan Ditolak</td>
										<?php } ?>
										<td>
											<?php if ($data['status'] == 5) {
												echo $data['alasan_cancel'];
											} ?>

										</td>
										<?php if ($data['pay_status'] == 'pending') { ?>
											<td>Belum dibayar</td>
										<?php } else if ($data['pay_status'] == 'settlement') { ?>
											<td>Lunas</td>
										<?php } else if ($data['pay_status'] == 'cancel') { ?>
											<td>Dibatalkan</td>
										<?php } else if ($data['pay_status'] == 'failure') { ?>
											<td>Gagal</td>
										<?php } else { ?>
											<td>Belum dibayar</td>
										<?php } ?>
									<?php } ?>
									<td>
										<a href="<?= base_url(); ?>administrator/order/<?= $data['invoice_code']; ?>" class="btn btn-sm btn-info"><i class="fa fa-eye"></i></a>
										<?php if ($data['status'] == 5) { ?>
											<button type="button" class="btn btn-sm btn-success open-modal" data-toggle="modal" data-target="#exampleModal" 
											data-invoice="<?= $data['invoice_code']; ?>"
											data-rekening="<?=$data['rekening_pengembalian']?>" data-nama="<?=$data['nama_rekening_pengembalian']?>">
												<i class="fa fa-check"></i>
											</button>
										<?php } ?>
									</td>
								</tr>
								<?php $no++; ?>
							<?php endforeach; ?>
						</tbody>
					</table>
					<?= $this->pagination->create_links(); ?>
				</div>
			<?php } else { ?>
				<div class="alert alert-warning" role="alert">
					Opss, pesanan masih kosong.
				</div>
			<?php } ?>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cancel Order</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="<?= base_url('transaction/konfirmasi_cancel/') ?>" method="POST">
					<div class="form-group">
						<label for="" class="form-label">Tindakan</label>
						<input type="hidden"  id="invoice_code" name="invoice_code">
						<select name="status" id="status" class="form-control" required>
							<option value="">Pilih Tindakan</option>
							<option value="6">Konfirmasi</option>
							<option value="7">Tolak</option>
						</select>
					</div>
					<div class="form-group">
						<label for="" class="form-label">Rekening Pengembalian</label>
						<input class="form-control" type="text"  id="rekening_pengembalian" name="rekening_pengembalian" readonly>
					</div>
					<div class="form-group">
						<label for="" class="form-label">Nama Rekening</label>
						<input class="form-control" type="text"  id="nama_rekening_pengembalian" name="nama_rekening_pengembalian" readonly>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
				<button type="submit" class="btn btn-primary">Simpan</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelectorAll('.open-modal').forEach(function(button) {
			button.addEventListener('click', function() {
				var invoiceCode = this.getAttribute('data-invoice');
				var rekening = this.getAttribute('data-rekening');
				var nama = this.getAttribute('data-nama');
				document.getElementById('invoice_code').value = invoiceCode;
				document.getElementById('rekening_pengembalian').value = rekening;
				document.getElementById('nama_rekening_pengembalian').value = nama;
			});
		});
	});
</script>