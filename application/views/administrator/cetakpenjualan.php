<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Penjualan</title>

	<style type="text/css">
		@media print {
		  @page { margin: 0; }
		  body { margin: 1.6cm; }
		}
	</style>
</head>
<body onload="window.print()">

	<h1 align="center">Laporan Penjualan</h1>
	<hr>

	<table width="100%" border="1" style="border-collapse: collapse;">
		<tr>
							<th style="text-align: center;">No</th>
							<th>Kode/Invoice</th>
							<th>Nama Produk</th>
							<th>Total Pesanan</th>
                            <th>Tanggal Pesan</th>
                            <th>Order Status</th>
                            <th>Pay Status</th>
						</tr>
						<?php $no = 1;$total=0; ?>
						<?php foreach($penjualan as $data): ?>
						<?php $total+=$data['total_price']; ?>
						<tr>
							<td style="text-align: center;"><?= $no; ?></td>
                            <td><?= $data['invoice_code']; ?></td>
                            <td><?= $data['product_name']; ?></td>
                            <td align="right">Rp <?= number_format($data['total_price'],0,",","."); ?></td>
							<td><?= $data['date_input']; ?></td>
							<?php if($data['courier'] == "cod"){ ?>
								<?php if($data['status'] != 4){ ?>
									<td>Cash of Delivery</td>
								<?php }else{ ?>
									<td>Selesai</td>
								<?php } ?>
							<?php }else{ ?>
							<?php if($data['status'] == 0){ ?>
								<td>Belum di proses</td>
                            <?php }else if($data['status'] == 1){ ?>
                                <td>Belum diproses</td>
                            <?php }else if($data['status'] == 2){ ?>
                                <td>Sedang diproses</td>
                            <?php }else if($data['status'] == 3){ ?>
                                <td>Sedang dikirim</td>
							<?php }else if($data['status'] == 4){ ?>
								<td>Selesai</td>
							<?php } ?>
							<?php if($data['pay_status'] == 'pending'){ ?>
                                <td>Belum dibayar</td>
							<?php }else if($data['pay_status'] == 'settlement'){ ?>
								<td>Lunas</td>
							<?php }else if($data['pay_status'] == 'cancel'){ ?>
								<td>Dibatalkan</td>
							<?php }else if($data['pay_status'] == 'failure'){ ?>
								<td>Gagal</td>
							<?php }else{ ?>
								<td>Belum dibayar</td>
							<?php } ?>
							<?php } ?>
                        </tr>
						<?php $no++; ?>
                        <?php endforeach; ?>
                        <tr>
                        	<td colspan="3" align="right">Total</td>
                        	<td align="right">Rp <?= number_format($total) ?></td>
                        </tr>
	</table>

</body>
</html>