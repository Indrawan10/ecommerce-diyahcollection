<div class="wrapper">
    <div class="title-head mb-5">
        <h2 class="title">Complain</h2>
    </div>

    <div class="card-body shadow rounded p-5">
        
        <?php if($this->session->flashdata('success')){ ?>
        <div class="alert alert-success" role="alert">
          <?= $this->session->flashdata('success') ?>
        </div>
        <?php } ?>

        <?php if(@$_SESSION['login']) { ?>
        <form method="post">
            <div class="form-group">
                <label>Nama</label>
                <input type="text" name="nama" class="form-control" required>
            </div>

            <div class="form-group">
                <label>No HP</label>
                <input type="text" name="nohp" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Jelaskan Complain</label>
                <textarea name="complain" class="form-control" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg rounded-pill mt-4">Simpan</button>
            </div>
        </form>
        <?php } else { ?>
            <div class="alert alert-warning">Mohon Login Untuk Complain</div>
        <?php } ?>
    </div>
</div>