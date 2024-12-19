<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Stok Masuk</title>

	<style type="text/css">
		@media print {
		  @page { margin: 0; }
		  body { margin: 1.6cm; }
		}
	</style>
</head>
<body onload="window.print()">

	<h1 align="center">Laporan Stok Masuk</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
								<th>#</th>
								<th>Tanggal</th>
								<th>Jenis Produk</th>
								<th>Jumlah Masuk</th>
							</tr>
							<?php $no = $this->uri->segment(3) + 1; ?>
							<?php foreach($stok as $data): ?>
							<tr>
								<td><?= $no ?></td>
								<td><?= date('d-m-Y',strtotime($data['created_at'])); ?></td>
								<td><?= $data['title']; ?></td>
								<td><?= $data['qty']; ?></td>
							</tr>
							<?php $no++ ?>
							<?php endforeach; ?>
	</table>

</body>
</html>