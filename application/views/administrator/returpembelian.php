<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Retur Pembelian</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">

		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<?php if ($retur->num_rows() > 0) { ?>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>#</th>
								<th>Supplier</th>
								<th>Produk</th>
								<th>Qty</th>
								<th>Harga</th>
								<th>Status</th>
								<th>Created At</th>
							</tr>
						</thead>
						<tfoot></tfoot>
						<tbody class="data-content">
							<?php $no = 1 ?>
							<?php foreach ($retur->result_array() as $data) : ?>
								<tr>
									<td><?= $no ?></td>
									<td><?= $data['nama']; ?></td>
									<td><?= $data['title']; ?></td>
									<td><?= $data['qty']; ?></td>
									<td><?= number_format($data['harga']); ?></td>
									<td>
										<form method="post" action="<?= base_url('administrator/status_retur/' . $data['id']) ?>">
											<select class="form-control" name="status">
												<option <?= $data['status'] == 'Pending' ? 'selected' : '' ?>>Pending</option>
												<option <?= $data['status'] == 'Proses' ? 'selected' : '' ?>>Proses</option>
												<option <?= $data['status'] == 'Selesai' ? 'selected' : '' ?>>Selesai</option>
											</select>

											<button type="submit" class="btn btn-primary btn-sm mt-2">Update</button>
										</form>

									</td>
									<td><?= date('d-m-Y H:i:s', strtotime($data['created_at'])); ?></td>
								</tr>
								<?php $no++ ?>
							<?php endforeach; ?>
						</tbody>
					</table>
				</div>
			<?php } else { ?>
				<div class="alert alert-warning" role="alert">
					Opss, pembelian masih kosong, yuk tambah sekarang.
				</div>
			<?php } ?>
		</div>
	</div>
</div>