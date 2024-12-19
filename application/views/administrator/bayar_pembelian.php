<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Bayar Pembelian</h1>

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
				method="post"
				enctype="multipart/form-data"
			>
			<div class="row">
				<div class="col-md-6">
			<div class="form-group">
						<label for="nama">Supplier</label>
						<select class="form-control" name="supplier_id" readonly>
							<?php foreach ($supplier as $item) { ?>
								<option value="<?= $item->id ?>" <?= $pembelian['supplier_id']==$item->id?"selected":""; ?>><?= $item->nama ?></option>
							<?php } ?>
						</select>
					</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
						<label for="nama">Tanggal</label>
						<input type="text" name="tanggal" readonly class="form-control" value="<?= date('d-m-Y H:i:s',strtotime($pembelian['created_at'])) ?>">
					</div>
					</div>

					<div class="col-md-6">
					<div class="form-group">
						<label for="alamat">Produk</label>
						<select class="form-control" name="product_id" required readonly>
							<?php foreach ($products as $item) { ?>
								<option value="<?= $item->id ?>" <?= $pembelian['product_id']==$item->id?"selected":""; ?>><?= $item->title ?></option>
							<?php } ?>
						</select>
					</div>
					</div>

					<div class="col-md-6">
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
							readonly
						/>
					</div>
					</div>

					<div class="col-md-6">
					<div class="form-group">
						<label for="qty">Qty</label>
						<input
							type="number"
							class="form-control"
							id="qty"
							name="qty"
							autocomplete="off"
							min="1"
							required
							value="<?= $pembelian['qty']; ?>"
						/>
					</div>
					</div>

					<div class="col-md-6">
					<div class="form-group">
						<label for="subtotal">Total Bayar</label>
						<input
							type="number"
							class="form-control"
							id="subtotal"
							name="bayar"
							autocomplete="off"
							min="1"
							required
							value="<?= $pembelian['qty']*$pembelian['harga']; ?>"
							readonly
						/>
					</div>
					</div>

					<!-- <div class="col-md-6">
					<div class="form-group">
						<label for="bayar">Total Bayar</label>
						<input
							type="number"
							class="form-control"
							id="bayar"
							name="bayar"
							autocomplete="off"
							min="1"
							required
						/>
					</div>
					</div> -->
</div>
				<button type="submit" class="btn btn-primary">Bayar Pembelian</button>
			</form>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$('#qty').on("input",function() {
		var val = $(this).val();
		var harga = $('#harga').val();
		val = parseInt(val);
		harga = parseInt(harga);

		if (val != 0) {
			$('#subtotal').val(val*harga);
		}

	});
</script>
<!-- /.container-fluid -->
