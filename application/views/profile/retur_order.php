<?php echo $this->session->flashdata('success'); ?>
<div class="wrapper">
    <?php include 'menu.php'; ?>
    <div class="core">
        <form method="post" enctype="multipart/form-data">
            <label>Produk</label>
            <select class="form-control" name="product_name">
                <?php foreach($product_order->result_array() as $item) { ?>
                <option><?= $item['product_name'] ?></option>
                <?php } ?>
            </select>
            <input type="hidden" class="form-control" value="<?= $ord['qty']?>" name="qty" id="qty">
            <label class="mt-3">Alasan</label>
            <textarea class="form-control" name="alasan"></textarea>

            <label class="mt-3">Upload Foto/Video</label>
            <input type="file" name="file" class="form-control">

            <button type="submit" class="btn btn-primary mt-4">Retur</button>
        </form>
    </div>
</div>