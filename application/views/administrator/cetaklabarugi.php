<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Laba Rubi</title>

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

	<h1 align="center">Laporan Laba Rugi</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
			<th style="text-align: center;">No</th>
			<th>Nama Produk</th>
			<th>Jumlah Pembelian</th>
			<th>Total Harga Pembelian</th>
			<th>Jumlah Terjual</th>
			<th>Total Harga Penjualan</th>
		</tr>
		<?php $no = 1;
		$totalPembelian = 0;
		$totalPenjualan = 0;
		?>
		<?php foreach ($result as $row) :
			$totalPembelian += $row['total_harga_pembelian'];
			$totalPenjualan += $row['total_harga_penjualan'];
		?>
			<tr>
				<td><?= $no++; ?></td>
				<td><?= $row['product_name']; ?></td>
				<td align="center"><?= $row['jumlah_pembelian'] ?  $row['jumlah_pembelian'] : "-" ?></td>
				<td>Rp<?= $row['total_harga_pembelian'] ? number_format($row['total_harga_pembelian'], 0, ",", ".") : "" ?></td>
				<td align="center"><?= $row['jumlah_terjual'] ? $row['jumlah_terjual'] : "-" ?></td>
				<td>Rp<?= $row['total_harga_penjualan'] ?  number_format($row['total_harga_penjualan'], 0, ",", ".") : "-" ?></td>
			</tr>
		<?php endforeach; ?>

		<tr>
			<td colspan="2" align="center"><strong>Total</strong></td>
			<td align="center" colspan="2"><strong>Rp <?= number_format($totalPembelian, 0, ",", ".") ?></strong></td>
			<td align="center" colspan="2"><strong>Rp <?= number_format($totalPenjualan, 0, ",", ".") ?></strong></td>
		</tr>
	</table>

</body>

</html>