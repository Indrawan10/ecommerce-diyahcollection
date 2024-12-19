<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Retur Pembelian</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<a href="<?= base_url(); ?>administrator/pembelian" class="btn btn-danger"><i class="fa fa-times-circle"></i> Batal</a>
		</div>
		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<form action="<?= base_url(); ?>administrator/retur/<?= $pembelian['id']; ?>" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="nama">Supplier</label>
					<select class="form-control" name="supplier_id" required>
						<?php foreach ($supplier as $item) { ?>
							<option value="<?= $item->id ?>" <?= $pembelian['supplier_id'] == $item->id ? "selected" : ""; ?>><?= $item->nama ?></option>
						<?php } ?>
					</select>
				</div>

				<div class="form-group">
					<label for="alamat">Produk</label>
					<select class="form-control" name="product_id" required>
						<?php foreach ($products as $item) { ?>
							<option value="<?= $item->id ?>" <?= $pembelian['product_id'] == $item->id ? "selected" : ""; ?>><?= $item->title ?></option>
						<?php } ?>
					</select>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label for="harga">Harga Pembelian</label>
							<input type="text" class="form-control" id="harga" name="harga" autocomplete="off" required value="Rp. <?= $pembelian['harga']  ?>" readonly />
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="qty">Qty Product Tersedia</label>
							<input type="number" class="form-control" id="qty" name="qty" autocomplete="off" max="<?= $pembelian['qty']; ?>" required value="<?= $pembelian['qty']; ?>" readonly />
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="qty_retur">Qty Retur</label>
							<input type="number" class="form-control" id="qty_retur" name="qty_retur" autocomplete="off" max="<?= $pembelian['qty']; ?>" required value="" />
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="harga_retur">Total Harga Retur</label>
							<input type="text" class="form-control" id="harga_retur" name="harga_retur" autocomplete="off" required value="" readonly />
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit Retur</button>
			</form>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$('#qty_retur').on("input", function() {
			var harga = $('#harga').val();
			var qtyRetur = $(this).val();
			var qty = $('#qty').val()
			if (parseInt(qtyRetur) > parseInt(qty)) {
				swal({
					text: 'Qty Retur Melebihi Batas Maksismum',
					icon: 'error'
				});
			}
			if (qtyRetur != 0) {
				var hargaRetur = parseInt(cleanCurrency(harga)) * parseInt(qtyRetur);
				$('#harga_retur').val("Rp. " + hargaRetur);
			}


		});

		function cleanCurrency(value) {
			return parseInt(value.replace(/[^0-9]/g, ''), 10);
		}
	});
</script>
<!-- /.container-fluid -->