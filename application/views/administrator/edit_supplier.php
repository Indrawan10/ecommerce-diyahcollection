<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Edit Supplier</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<a
				href="<?= base_url(); ?>administrator/supplier"
				class="btn btn-danger"
				><i class="fa fa-times-circle"></i> Batal</a
			>
		</div>
		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<form
				action="<?= base_url(); ?>administrator/suppliers/<?= $supplier['id']; ?>"
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
						required
						autocomplete="off"
						value="<?= $supplier['nama']; ?>"
					/>
				</div>

				<div class="form-group">
					<label for="alamat">Alamat</label>
					<input
						type="text"
						class="form-control"
						id="alamat"
						name="alamat"
						required
						autocomplete="off"
						value="<?= $supplier['alamat']; ?>"
					/>
				</div>

				<div class="form-group">
					<label for="nohp">No HP</label>
					<input
						type="text"
						class="form-control"
						id="nohp"
						name="nohp"
						required
						autocomplete="off"
						value="<?= $supplier['nohp']; ?>"
					/>
				</div>

				<button type="submit" class="btn btn-primary">Edit Supplier</button>
			</form>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
