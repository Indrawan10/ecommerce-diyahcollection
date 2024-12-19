<?php echo $this->session->flashdata('upload'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Retur Customer</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">

		<div class="card-body">
			<?php echo $this->session->flashdata('failed'); ?>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>#</th>
							<th>Produk</th>
							<th>Alasan</th>

							<th>No Rek</th>
							<th>Jenis Bank</th>
							<th>Bukti</th>
							<th>Status</th>
							<th>Created At</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody class="data-content">
						<?php $no = 1 ?>
						<?php foreach ($retur as $data) : ?>
							<tr>
								<td><?= $no ?></td>
								<td><?= $data['product_name']; ?></td>
								<td><?= $data['alasan']; ?></td>

								<td><?= $data['norek']; ?></td>
								<td><?= $data['jenis_bank']; ?></td>
								<td><a href="<?= base_url('uploads/' . $data['file']) ?>" download>Bukti</a></td>
								<td><?= $data['status']; ?></td>
								<td><?= date('d-m-Y H:i:s', strtotime($data['created_at'])); ?></td>
								<td>
									<?php if ($data['status'] == "") { ?>
										<a href="<?= base_url(); ?>administrator/stsretur/<?= $data['id']; ?>/terima" class="btn btn-sm btn-success">Terima</a>
										<a href="<?= base_url(); ?>administrator/stsretur/<?= $data['id']; ?>/tolak" class="btn btn-sm btn-danger">Tolak</a>
									<?php } ?>
									<?php if ($data['status'] == "terima") { ?>
										<a href="<?= base_url(); ?>administrator/stsretur/<?= $data['id']; ?>/selesai" class="btn btn-sm btn-success">Selesai</a>
									<?php } ?>
								</td>
							</tr>
							<?php $no++ ?>
						<?php endforeach; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>