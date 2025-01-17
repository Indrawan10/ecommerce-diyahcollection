<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Supplier</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<a
				href="#"
				class="btn btn-primary"
				data-toggle="modal"
				data-target="#addCategory"
				>Tambah</a
			>
		</div>
		<div class="card-body">
            <?php echo $this->session->flashdata('failed'); ?> 
            <?php if($supplier->num_rows() > 0){ ?>
			<div class="table-responsive">
				<table
					class="table table-bordered"
					id="dataTable"
					width="100%"
					cellspacing="0"
				>
					<thead>
						<tr>
							<th>#</th>
							<th>Nama</th>
                            <th>Alamat</th>
                            <th>No HP</th>
                            <th>Aksi</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody class="data-content">
                        <?php $no = 1 ?>
						<?php foreach($supplier->result_array() as $data): ?>
						<tr>
                            <td><?= $no ?></td>
                            <td><?= $data['nama']; ?></td>
                            <td><?= $data['alamat']; ?></td>
                            <td><?= $data['nohp']; ?></td>
                            <td style="width: 100px">
                                <a href="<?= base_url() ;?>administrator/suppliers/<?= $data['id']; ?>" class="btn btn-sm btn-info"><i class="fa fa-pen"></i></a>
                                <a href="<?= base_url() ;?>administrator/delete_supplier/<?= $data['id']; ?>" onclick="return confirm('Yakin ingin menghapus kategori? Semua produk dengan kategori ini akan ikut terhapus')" class="btn btn-sm btn-danger"><i class="fa fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <?php $no++ ?>
                        <?php endforeach; ?>
					</tbody>
				</table>
			</div>
			<?php }else{ ?>
			<div class="alert alert-warning" role="alert">
				Opss, supplier masih kosong, yuk tambah sekarang.
			</div>
            <?php } ?>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

<!-- Modal Add Category -->
<div
	class="modal fade"
	id="addCategory"
	tabindex="-1"
	role="dialog"
	aria-labelledby="exampleModalLabel"
	aria-hidden="true"
>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Tambah Testimoni</h5>
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-label="Close"
				>
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="<?= base_url(); ?>administrator/supplier"
					method="post"
					enctype="multipart/form-data"
				>
					<div class="form-group">
						<label for="nama">Nama</label>
						<input
							type="text"
							class="form-control"
							id="nama"
							name="nama"
							autocomplete="off"
							required
						/>
					</div>

					<div class="form-group">
						<label for="alamat">Alamat</label>
						<input
							type="text"
							class="form-control"
							id="alamat"
							name="alamat"
							autocomplete="off"
							required
						/>
					</div>

					<div class="form-group">
						<label for="nohp">No HP</label>
						<input
							type="text"
							class="form-control"
							id="nohp"
							name="nohp"
							autocomplete="off"
							required
						/>
					</div>

					<button type="submit" class="btn btn-primary" id="btnAddCategory">
						Tambah
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
