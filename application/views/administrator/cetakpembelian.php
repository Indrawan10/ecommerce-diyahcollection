<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Pembelian</title>

	<style type="text/css">
		@media print {
		  @page { margin: 0; }
		  body { margin: 1.6cm; }
		}
	</style>
</head>
<body onload="window.print()">

	<h1 align="center">Laporan Pembelian</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
							<th>#</th>
							<th>Supplier</th>
                            <th>Produk</th>
                            <th>Harga</th>
							<th>Qty</th>
							<th>Total</th>
                            <th>Status</th>
                            <th>Created At</th>
						</tr>
						<?php $no = 1;$total=0; ?>
						<?php foreach($pembelian as $data): ?>
							<?php $total+=$data['qty'] * (float)$data['harga']; ?>
						<tr>
                            <td><?= $no ?></td>
                            <td><?= $data['nama']; ?></td>
                            <td><?= $data['title']; ?></td>
                            <td>Rp. <?= number_format($data['harga'], 0,',','.'); ?></td>
                            <td align="center"><?= $data['qty']; ?></td>
                            <td>Rp. <?= number_format($data['qty'] * (float)$data['harga'], 0,',','.'); ?></td>
                            <td><?= $data['status']; ?></td>
                            <td><?= date('d-m-Y H:i:s',strtotime($data['created_at'])); ?></td>
                        </tr>
                        <?php $no++ ?>
                        <?php endforeach; ?>
                        <tr>
                        	<td colspan="4" align="right" style="font-size: 22px;"><strong>Total</strong></td>
                        	<td colspan="4" align="center" style="font-size: 22px;">Rp. <?= number_format($total, 0,',','.') ?></td>
                        </tr>
	</table>

</body>
</html>