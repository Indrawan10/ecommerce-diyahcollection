<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Pendapatan</title>

	<style type="text/css">
		@media print {
			@page {
				margin: 0;
			}

			body {
				margin: 1.6cm;
			}
		}
	</style>
</head>

<body onload="window.print()">

	<h1 align="center">Laporan Pendapatan</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
			<th style="text-align: center;">No</th>
			<th>Nama Produk</th>
			<th>Jumlah Terjual</th>
			<th>Harga Satuan</th>
			<th>Total Harga</th>
		</tr>
		<?php
		$no = 1;
		$total = 0;
		foreach ($pendapatan as $row) :
			$total += $row['total_price'];
		?>
			<tr>
				<td style="text-align: center;"><?= $no++; ?></td>
				<td><?= $row['product_name']; ?></td>
				<td align="center"><?= $row['total_sold']; ?></td>
				<td align="center"><?= $row['total_sold']; ?></td>
				<td>Rp<?= number_format($row['unit_price'], 0, ",", "."); ?></td>
				<td>Rp<?= number_format($row['total_price'], 0, ",", "."); ?></td>
			</tr>
		<?php endforeach; ?>
		<tr>
			<td colspan="3" align="center"><strong>Total</strong></td>
			<td align="center" colspan="2"><strong>Rp <?= number_format($total,0, ",", ".") ?></strong></td>
		</tr>
	</table>

</body>

</html>