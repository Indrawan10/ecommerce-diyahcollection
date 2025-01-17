<style>
    .ratings-reviews {
        margin-top: 20px;
    }

    .review {
        margin-bottom: 20px;
    }

    .review-user {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .user-photo {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .user-name {
        font-weight: bold;
    }

    .review-rating span {
        font-size: 20px;
    }

    .filled-star {
        color: #FFD700;
        /* Warna emas untuk bintang terisi */
    }

    .empty-star {
        color: #D3D3D3;
        /* Warna abu-abu untuk bintang kosong */
    }

    .review-text {
        margin-top: 10px;
    }
</style>
<div class="wrapper">
    <div class="navigation">
        <a href="<?= base_url(); ?>">Home</a>
        <i class="fa fa-caret-right"></i>
        <a href="<?= base_url(); ?>c/<?= $product['slug']; ?>"><?= $product['name']; ?></a>
        <i class="fa fa-caret-right"></i>
        <a><?= $product['title']; ?></a>
    </div>
    <?php $setting = $this->db->get('settings')->row_array(); ?>
    <div class="top">
        <div class="main-top">
            <div class="img">
                <a href="<?= base_url(); ?>assets/images/product/<?= $product['img']; ?>" data-lightbox="img-1">
                    <img src="<?= base_url(); ?>assets/images/product/<?= $product['img']; ?>" alt="produk" class="jumbo-thumb">
                </a>
                <div class="img-slider">
                    <img src="<?= base_url(); ?>assets/images/product/<?= $product['img']; ?>" alt="gambar" class="thumb">
                    <?php foreach ($img->result_array() as $d) : ?>
                        <img src="<?= base_url(); ?>assets/images/product/<?= $d['img']; ?>" alt="gambar" class="thumb">
                    <?php endforeach; ?>
                </div>
            </div>
            <div class="ket">
                <h1 class="title"><?= $product['title']; ?></h1>
                <p class="subtitle">Terjual <?= $product['transaction']; ?> Produk &bull; <?= $product['viewer']; ?>x Dilihat</p>
                <hr>
                <table>
                    <?php if ($setting['promo'] == 1) { ?>
                        <?php if ($product['promo_price'] == 0) { ?>
                            <tr>
                                <td class="t">Harga</td>
                                <td class="price">Rp <?= str_replace(",", ".", number_format($product['price'])); ?></td>
                            </tr>
                        <?php } else { ?>
                            <tr>
                                <td class="t">Harga</td>
                                <td class="oldPrice">Rp <?= str_replace(",", ".", number_format($product['price'])); ?></td>
                            </tr>
                            <tr class="newPrice">
                                <td></td>
                                <td class="price">Rp <?= str_replace(",", ".", number_format($product['promo_price'])); ?></td>
                            </tr>
                        <?php } ?>
                    <?php } else { ?>
                        <tr>
                            <td class="t">Harga</td>
                            <td class="price">Rp <?= str_replace(",", ".", number_format($product['price'])); ?></td>
                        </tr>
                    <?php } ?>
                    <tr>
                        <td class="t">Kondisi</td>
                        <?php if ($product['condit'] == 1) { ?>
                            <td>Baru</td>
                        <?php } else { ?>
                            <td>Bekas</td>
                        <?php } ?>
                    </tr>
                    <tr>
                        <td class="t">Berat</td>
                        <td><?= $product['weight']; ?> gram</td>
                    </tr>
                    <tr>
                        <td class="t">Stok</td>
                        <td>
                            <?= $product['stock']; ?> produk
                            <!-- Tambahkan keterangan jika stok habis -->
                            <?php if ($product['stock'] == 0) { ?>
                                <span style="color: red; font-weight: bold;">(Produk Habis)</span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <?php if ($setting['promo'] == 1) { ?>
                            <?php if ($product['promo_price'] == 0) { ?>
                                <?php $priceP = $product['price']; ?>
                            <?php } else { ?>
                                <?php $priceP = $product['promo_price']; ?>
                            <?php } ?>
                        <?php } else { ?>
                            <?php $priceP = $product['price']; ?>
                        <?php } ?>
                        <td class="t">Jumlah</td>
                        <td>
                            <button onclick="minusProduct(<?= $priceP; ?>)">-</button><!--
                        --><input disabled type="text" value="1" id="qtyProduct" class="valueJml"><!--
                        --><button onclick="plusProduct(<?= $priceP; ?>, <?= $product['stock']; ?>)">+</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">Total</td>
                        <td>Rp <span id="detailTotalPrice"><?= str_replace(",", ".", number_format($priceP)); ?></span></td>
                    </tr>
                </table>
                <hr>
                <?php if ($this->session->userdata('login')) { ?>
                    <!-- Tambahkan logika pengecekan stok di sini -->
                    <?php if ($product['stock'] > 0) { ?>
                        <button class="btn btn-warning pl-5 pr-5" onclick="buy()">Beli</button>
                        <button class="btn btn-primary" onclick="addCart()">Tambah ke Keranjang</button>
                    <?php } else { ?>
                        <button class="btn btn-warning pl-5 pr-5" disabled>Beli</button>
                        <button class="btn btn-primary" disabled>Tambah ke Keranjang</button>
                    <?php } ?>
                <?php } else { ?>
                    <a href="<?= base_url(); ?>login" class="btn btn-secondary">Login dulu</a>
                <?php } ?>
            </div>
        </div>
    </div>
    <hr>
    <div class="description">
        <?= nl2br($product['description']); ?>
    </div>
    <hr>
    <div class="ratings-reviews">
        <h3>Rating dan Ulasan</h3>

        <?php if (!empty($reviews)) : ?>
            <?php foreach ($reviews as $review) : ?>
                <div class="review">
                    <div class="review-user">
                        <img src="<?= base_url(); ?>assets/images/profile/<?= $review['photo_profile']; ?>" alt="<?= $review['name'] ?>" class="user-photo">
                        <p class="user-name"><?= $review['name'] ?></p>
                    </div>
                    <div class="review-rating">

                        <?php for ($i = 1; $i <= 5; $i++) : ?>
                            <?php if ($i <= $review['star']) : ?>
                                <span class="filled-star">&#9733;</span> <!-- Filled star -->
                            <?php else : ?>
                                <span class="empty-star">&#9734;</span> <!-- Empty star -->
                            <?php endif; ?>
                        <?php endfor; ?>
                    </div>
                    <div class="review-text">
                        <p><?= nl2br($review['ulasan']); ?></p>
                    </div>
                    <hr>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<script>
    function plusProduct(price, stock) {
        let inputJml;
        inputJml = parseInt($("input.valueJml").val());
        inputJml = inputJml + 1;
        if (inputJml <= stock) {
            $.ajax({
                url: `<?= base_url(); ?>products/getgrosir?product=<?= $product['productId']; ?>&stock=${inputJml}`,
                type: "get",
                async: true,
                success: function(response) {
                    if (response) {
                        $("input.valueJml").val(inputJml);
                        $("td.price").html("Rp " + number_format(response).split(",").join(".") + " <small style='font-size: 13px; font-weight: normal' class='badge badge-info'>grosir</small>");
                        const newPrice = inputJml * response;
                        const rpFormat = number_format(newPrice);
                        $("#detailTotalPrice").text(rpFormat.split(",").join("."));
                    } else {
                        $("input.valueJml").val(inputJml);
                        $("td.price").html("Rp " + number_format(price).split(",").join("."));
                        const newPrice = inputJml * price;
                        const rpFormat = number_format(newPrice);
                        $("#detailTotalPrice").text(rpFormat.split(",").join("."));
                    }
                }
            })
        }
    }

    function minusProduct(price) {
        let inputJml;
        inputJml = parseInt($("input.valueJml").val());
        inputJml = inputJml - 1;
        if (inputJml >= 1) {
            $.ajax({
                url: `<?= base_url(); ?>products/getgrosir?product=<?= $product['productId']; ?>&stock=${inputJml}`,
                type: "get",
                async: true,
                success: function(response) {
                    if (response) {
                        $("input.valueJml").val(inputJml);
                        $("td.price").html("Rp " + number_format(response).split(",").join(".") + " <small style='font-size: 13px; font-weight: normal' class='badge badge-info'>grosir</small>");
                        const newPrice = inputJml * response;
                        const rpFormat = number_format(newPrice);
                        $("#detailTotalPrice").text(rpFormat.split(",").join("."));
                    } else {
                        $("input.valueJml").val(inputJml);
                        $("td.price").html("Rp " + number_format(price).split(",").join("."));
                        const newPrice = inputJml * price;
                        const rpFormat = number_format(newPrice);
                        $("#detailTotalPrice").text(rpFormat.split(",").join("."));
                    }
                }
            })
        }
    }

    function number_format(number, decimals, decPoint, thousandsSep) {
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '')
        var n = !isFinite(+number) ? 0 : +number
        var prec = !isFinite(+decimals) ? 0 : Math.abs(decimals)
        var sep = (typeof thousandsSep === 'undefined') ? ',' : thousandsSep
        var dec = (typeof decPoint === 'undefined') ? '.' : decPoint
        var s = ''

        var toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec)
            return '' + (Math.round(n * k) / k)
                .toFixed(prec)
        }

        // @todo: for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.')
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep)
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || ''
            s[1] += new Array(prec - s[1].length + 1).join('0')
        }

        return s.join(dec)
    }

    function buy() {
        if (<?= $product['stock']; ?> > 0) { // Cek stok
            // $.ajax({
            //     url: "<?= base_url(); ?>checkout?id",
            //     type: "post",
            //     data: {
            //         id: <?= $product['productId']; ?>,
            //         qty: $("#qtyProduct").val()
            //     },
            //     success: function(data) {
            //         location.href = "<?= base_url(); ?>chekcout?id"
            //     }
            // });

            location.href = "<?= base_url('checkout'); ?>?id=" + <?= $product['productId']; ?> + "&qty=" + $("#qtyProduct").val();
        } else {
            alert("Stok habis, tidak bisa membeli.");
            $("td:contains('<?= $product['stock']; ?> produk')").append('<span style="color: red; font-weight: bold;">(Produk Habis)</span>');
        }
    }

    function addCart() {
        if (<?= $product['stock']; ?> > 0) { // Cek stok
            $.ajax({
                url: "<?= base_url(); ?>cart/add_to_cart",
                type: "post",
                data: {
                    id: <?= $product['productId']; ?>,
                    qty: $("#qtyProduct").val()
                },
                success: function(data) {
                    $(".navbar-cart-inform").html(`<i class="fa fa-shopping-cart"></i> Keranjang(<?= count($this->cart->contents()) + 1; ?>)`);
                    swal({
                            title: "Berhasil Ditambah ke Keranjang",
                            text: `<?= $product['title']; ?>`,
                            icon: "success",
                            buttons: true,
                            buttons: ["Lanjut Belanja", "Lihat Keranjang"],
                        })
                        .then((cart) => {
                            if (cart) {
                                location.href = "<?= base_url(); ?>cart"
                            }
                        });
                }
            });
        } else {
            alert("Stok habis, tidak bisa menambah ke keranjang.");
            $("td:contains('<?= $product['stock']; ?> produk')").append('<span style="color: red; font-weight: bold;">(Produk Habis)</span>');
        }
    }

    // slider product
    const containerImgProduct = document.querySelector("div.wrapper div.top div.main-top div.img");
    const jumboImgProduct = document.querySelector("div.wrapper div.top div.main-top div.img img.jumbo-thumb");
    const jumboHrefImgProduct = document.querySelector("div.wrapper div.top div.main-top div.img a");
    const thumbsImgProduct = document.querySelectorAll("div.wrapper div.top div.main-top div.img div.img-slider img.thumb");

    containerImgProduct.addEventListener('click', function(e) {
        if (e.target.className == 'thumb') {
            jumboImgProduct.src = e.target.src;
            jumboHrefImgProduct.href = e.target.src;

            thumbsImgProduct.forEach(function(thumb) {
                thumb.className = 'thumb';
            })
        }
    })
</script>