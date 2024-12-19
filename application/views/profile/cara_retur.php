<?php echo $this->session->flashdata('success'); ?>
<div class="wrapper">
    <?php include 'menu.php'; ?>
    <div class="core">
        <h3>Alamat Toko</h3>
        <p>
            Jl. Raya Kluwut, Toko Diyah Collection Kluwut, Kec. Bulakamba, Kabupaten Brebes, Jawa Tengah 52253
        </p>
        <form method="post" enctype="multipart/form-data">
            <label>No Rekening</label>
            <input type="text" name="norek" class="form-control">

            <label>Jenis Bank</label>
            <input type="text" name="jenis_bank" class="form-control">

            <label class="mt-3">Bukti Resi</label>
            <input type="file" name="bukti" class="form-control">

            <button type="submit" class="btn btn-primary mt-4">Submit</button>
        </form>
    </div>
</div>