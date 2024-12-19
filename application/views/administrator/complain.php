
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800 mb-4">Data Complain</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">

		<div class="card-body">

            <?php if(count($complain) > 0){ ?>
			<div class="table-responsive">
				<table
					class="table table-bordered"
					id="dataTable"
					width="100%"
					cellspacing="0"
				>
					<thead>
						<tr>
							<th>#</th>
							<th>Nama</th>
                            <th>No HP</th>
                            <th>Complain</th>
                            <th>Created At</th>
                            <th>Aksi</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody class="data-content">
                        <?php $no = 1 ?>
						<?php foreach($complain as $data): ?>
						<tr>
                            <td><?= $no ?></td>
                            <td><?= $data['nama']; ?></td>
                            <td><?= $data['nohp']; ?></td>
                            <td><?= $data['complain']; ?></td>
                            <td><?= date('d-m-Y H:i:s',strtotime($data['created_at'])); ?></td>
                            <td>
                                <a href="<?= base_url() ;?>administrator/deleteComplain/<?= $data['id']; ?>" onclick="return confirm('Yakin ingin menghapus kategori? Semua produk dengan kategori ini akan ikut terhapus')" class="btn btn-sm btn-danger"><i class="fa fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <?php $no++ ?>
                        <?php endforeach; ?>
					</tbody>
				</table>
			</div>
			<?php }else{ ?>
			<div class="alert alert-warning" role="alert">
				Opss, Complain masih kosong, yuk tambah sekarang.
			</div>
            <?php } ?>
		</div>
	</div>
</div>
<!-- /.container-fluid -->

