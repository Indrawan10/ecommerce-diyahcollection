<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Pembelian</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addCategory">Tambah</a>
		</div>
		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<?php if ($pembelian->num_rows() > 0) { ?>
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
								<th>Aksi</th>
							</tr>
						</thead>
						<tfoot></tfoot>
						<tbody class="data-content">
							<?php $no = 1 ?>
							<?php foreach ($pembelian->result_array() as $data) : ?>
								<tr>
									<td><?= $no ?></td>
									<td><?= $data['nama']; ?></td>
									<td><?= $data['title']; ?></td>
									<td><?= $data['qty']; ?></td>
									<td><?= number_format($data['harga']); ?></td>
									<td><?= $data['status']; ?></td>
									<td><?= date('d-m-Y H:i:s', strtotime($data['created_at'])); ?></td>
									<td style="width: 100px">
										<?php if ($data['status'] == 'Belum Bayar') { ?>
											<a href="<?= base_url(); ?>administrator/bayar/<?= $data['id']; ?>" class="btn btn-sm btn-success"><i class="fa fa-money-bill"></i></a>

											<a href="<?= base_url(); ?>administrator/pembelians/<?= $data['id']; ?>" class="btn btn-sm btn-info"><i class="fa fa-pen"></i></a>
											<a href="<?= base_url(); ?>administrator/delete_pembelian/<?= $data['id']; ?>" onclick="return confirm('Yakin ingin menghapus kategori? Semua produk dengan kategori ini akan ikut terhapus')" class="btn btn-sm btn-danger"><i class="fa fa-trash-alt"></i></a>
										<?php } else { ?>
											<?php if ($data['qty'] != 0) { ?>
												<a href="<?= base_url(); ?>administrator/retur/<?= $data['id']; ?>" class="btn btn-sm btn-warning">Retur</a>
											<?php } ?>
										<?php } ?>
									</td>
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
<!-- /.container-fluid -->

<!-- Modal Add Category -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Tambah Pembelian</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="<?= base_url(); ?>administrator/pembelian" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="nama">Supplier</label>
						<select class="form-control" name="supplier_id" required>
							<?php foreach ($supplier as $item) { ?>
								<option value="<?= $item->id ?>"><?= $item->nama ?></option>
							<?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label for="alamat">Produk</label>
						<select class="form-control" name="product_id" required>
							<?php foreach ($products as $item) { ?>
								<option value="<?= $item->id ?>"><?= $item->title ?></option>
							<?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label for="harga">Harga</label>
						<input type="number" class="form-control" id="harga" name="harga" autocomplete="off" required />
					</div>

					<button type="submit" class="btn btn-primary" id="btnAddCategory">
						Tambah
					</button>
				</form>
			</div>
		</div>
	</div>
</div>