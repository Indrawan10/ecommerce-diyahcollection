<div class="wrapper">
    <div class="title-head">
        <h2 class="title">Testimoni</h2>
    </div>
    <?php if ($testi->num_rows() > 0) { ?>
        <div class="testi mt-4">
            <div class="row">
                <?php foreach ($testi->result_array() as $data) { ?>
                    <div class="col-lg-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><?= $data['name']; ?></h5>
                                <p class="card-text"><?= $data['content']; ?></p>
                                <div class="star-rating">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <span class="<?= $i <= $data['rating'] ? 'text-warning' : 'text-muted' ?>">&#9733;</span>
                                    <?php } ?>
                                </div>

                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    <?php } else { ?>
        <div class="alert alert-warning mt-4">Upss.. Belum ada testimoni</div>
    <?php } ?>
</div>