<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Edit Pembelian</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<a
				href="<?= base_url(); ?>administrator/pembelian"
				class="btn btn-danger"
				><i class="fa fa-times-circle"></i> Batal</a
			>
		</div>
		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<form
				action="<?= base_url(); ?>administrator/pembelians/<?= $pembelian['id']; ?>"
				method="post"
				enctype="multipart/form-data"
			>
			<div class="form-group">
						<label for="nama">Supplier</label>
						<select class="form-control" name="supplier_id" required>
							<?php foreach ($supplier as $item) { ?>
								<option value="<?= $item->id ?>" <?= $pembelian['supplier_id']==$item->id?"selected":""; ?>><?= $item->nama ?></option>
							<?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label for="alamat">Produk</label>
						<select class="form-control" name="product_id" required>
							<?php foreach ($products as $item) { ?>
								<option value="<?= $item->id ?>" <?= $pembelian['product_id']==$item->id?"selected":""; ?>><?= $item->title ?></option>
							<?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label for="harga">Harga</label>
						<input
							type="number"
							class="form-control"
							id="harga"
							name="harga"
							autocomplete="off"
							required
							value="<?= $pembelian['harga']; ?>"
						/>
					</div>

				<button type="submit" class="btn btn-primary">Edit Pembelian</button>
			</form>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
