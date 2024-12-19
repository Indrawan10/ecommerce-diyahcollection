<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Retur Customer</title>

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

	<h1 align="center">Laporan Retur Customer</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
			<th style="text-align: center;">No</th>
			<th>Kode/Invoice</th>
			<th>Nama Produk</th>
			<th>Qty</th>
			<th>Harga</th>
			<th>Total</th>
			<th>Status</th>
		</tr>
		<?php $no = 1;
		$total = 0; ?>
		<?php foreach ($retur as $data) : ?>
			<?php $total += $data['total_price'] * $data['qty']; ?>
			<tr>
				<td style="text-align: center;"><?= $no; ?></td>
				<td><?= $data['id_invoice']; ?></td>
				<td><?= $data['product_name']; ?></td>
				<td align="center"><?= $data['qty'] ?></td>
				<td>Rp. <?= number_format($data['total_price'], 0,',','.')?></td>
				<td>Rp. <?= number_format($data['total_price'] * $data['qty'], 0,',','.')?></td>
				<td><?= ucfirst($data['status'])?></td>
			</tr>
			<?php $no++; ?>
		<?php endforeach; ?>
		<tr>
		<td colspan="4" align="right" style="font-size: 22px;"><strong>Total</strong></td>
		<td colspan="4" align="center" style="font-size: 22px;">Rp. <?= number_format($total, 0,',','.') ?></td>
		</tr>
	</table>

</body>

</html>