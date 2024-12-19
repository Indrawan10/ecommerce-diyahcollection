<head>
    <style>
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
        }

        .rating input {
            display: none;
        }

        .rating label {
            position: relative;
            width: 1em;
            font-size: 2rem;
            color: #FFD700;
            cursor: pointer;
        }

        .rating label::before {
            content: "\2605";
            position: absolute;
            opacity: 0;
            transition: opacity 0.2s;
        }

        .rating label:hover::before,
        .rating label:hover~label::before,
        .rating input:checked~label::before {
            opacity: 1 !important;
        }

        .rating label::after {
            content: "\2606";
            /* Unicode for outlined star */
            position: absolute;
            color: #FFD700;
            opacity: 1;
        }

        .rating input:checked~label::after {
            opacity: 0;
        }
    </style>
</head>

<div class="wrapper" style="display: flex; justify-content: center;">
    <div class="core">
        <h2 class="title">Detail Pesanan</h2>
        <a target="_blank" href="<?= base_url('transaction/print/' . $ord['invoice_code']) ?>" class="btn btn-secondary btn-sm">Print</a></h2>
        <hr>
        <table class="table table-sm table-borderless">
            <tr>
                <td>Order ID</td>
                <td><?= $ord['invoice_code']; ?></td>
            </tr>
            <tr>
                <td>Tanggal Pesan</td>
                <td><?= $ord['date_input']; ?></td>
            </tr>
            <tr>
                <td>Status</td>
                <?php if ($ord['courier'] == "cod") { ?>
                    <td>Cash of Delivery</td>
                <?php } else { ?>
                    <?php if ($ord['pay_status'] == 'pending' || $ord['pay_status'] == '') { ?>
                        <td>Belum dibayar</td>
                    <?php } else if ($ord['pay_status'] == 'settlement' && $ord['status'] == 0) { ?>
                        <td>Menunggu konfirmasi</td>
                    <?php } else if ($ord['status'] == 2) { ?>
                        <td>Sedang diproses</td>
                    <?php } else if ($ord['status'] == 3) { ?>
                        <td>Sedang dikirim</td>
                    <?php } else { ?>
                        <td>Selesai</td>
                    <?php } ?>
                <?php } ?>
            </tr>
            <tr>
                <td>Total Pembayaran</td>
                <th class="text-primary">Rp<?= number_format($ord['total_all'], 0, ",", "."); ?></th>
            </tr>
        </table>
        <hr>
        <hr>
        <h2 class="title">Alamat Pengiriman</h2>
        <hr>
        <table class="table table-sm table-borderless">
            <tr>
                <td>Nama Penerima</td>
                <td><?= $ord['name']; ?></td>
            </tr>
            <tr>
                <td>Alamat</td>
                <td><?= $ord['address']; ?></td>
            </tr>
            <tr>
                <td></td>
                <td><?= $ord['village']; ?> - <?= $ord['district']; ?></td>
            </tr>
            <tr>
                <td></td>
                <td><?= $regency; ?> <?= $province; ?> - <?= $ord['zipcode']; ?></td>
            </tr>
            <tr>
                <td>Telepon</td>
                <td><?= $ord['telp']; ?></td>
            </tr>
        </table>
        <hr>
        <hr>
        <div class="row">
            <div class="col-md-7">
                <h2 class="title mb-3">Produk Pesanan</h2>
                <?php foreach ($product_order->result_array() as $p) :
                    $rating = $this->db->get_where('rating', ['product_id' => $p['productID'], 'invoice_code' => $ord['invoice_code']])->num_rows();
                ?>
                    <div class="item-product">
                        <img src="<?= base_url(); ?>assets/images/product/<?= $p['img']; ?>" alt="produk <?= $p['product_name']; ?>">
                        <a href="<?= base_url(); ?>p/<?= $p['slug']; ?>">
                            <h3 class="product_name mb-0"><?= $p['product_name']; ?></h3>
                        </a>
                        <p class="mb-0">Jumlah: <?= $p['qty']; ?></p>
                        <p class="mb-0 price">Rp<?= number_format($p['price'] * $p['qty'], 0, ",", "."); ?></p>
                        <div class="clearfix"></div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="col-md-5">
                <h2 class="title">Ringkasan Pembayaran</h2>
                <table class="table table-sm table-borderless">
                    <tr>
                        <td>Jumlah Produk</td>
                        <td>: <?= $product_order->num_rows(); ?></td>
                    </tr>
                    <tr>
                        <td>Harga Produk</td>
                        <td>: Rp<?= number_format($ord['total_price'], 0, ",", "."); ?></td>
                    </tr>
                    <tr>
                        <td>Ongkis Kirim</td>
                        <td>: Rp<?= number_format($ord['ongkir'], 0, ",", "."); ?></td>
                    </tr>
                    <tr>
                        <td>Total Belanja</td>
                        <td>: Rp<?= number_format($ord['total_all'], 0, ",", "."); ?>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="<?= base_url(); ?>assets/js/jquery.countdown.min.js"></script>
<script src="<?= base_url(); ?>assets/lightbox2-2.11.1/dist/js/lightbox.js"></script>
<script src="<?= base_url(); ?>assets/select2-4.0.6-rc.1/dist/js/select2.min.js"></script>
<script>
    $('.recent-product').slick({
        infinite: false,
        slidesToShow: 6,
        slidesToScroll: 1
    });

    $("i.icon-search-navbar").on('click', function() {
        $("div.search-form").slideDown('fast');
        $("div.search-form input").focus();
    })

    $("div.search-form i").on('click', function() {
        $("div.search-form").slideUp('fast');
    })

    $("i.fa-bars").on('click', function() {
        $("div.dropdown-mobile-menu").slideToggle('fast');
    })

    $("div.product-wrapper div.main-product button.slick-prev").html("<i class='fa fa-chevron-left'></i>")
    $("div.product-wrapper div.main-product button.slick-next").html("<i class='fa fa-chevron-right'></i>")

    const years = new Date().getFullYear();
    $("#footer-cr-years").text(years);

    $("#countdownPromo").countdown({
        date: "<?= $setting['promo_time']; ?>",
        render: function(data) {
            var el = $(this.el);
            el.empty()
                .append(
                    this.leadingZeros(data.days, 2) + " : "
                )
                .append(
                    this.leadingZeros(data.hours, 2) + " : "
                )
                .append(
                    this.leadingZeros(data.min, 2) + " : "
                )
                .append(
                    this.leadingZeros(data.sec, 2)
                );
        },
    });

    //loading screen
    $(window).ready(function() {
        $(".loading-animation-screen").fadeOut("slow");
    })


    // detail
    $("#detailBtnPlusJml").click(function() {
        var val = parseInt($(this).prev('input').val());
        $(this).prev('input').val(val + 1).change();
        return false;
    })

    $("#detailBtnMinusJml").click(function() {
        var val = parseInt($(this).next('input').val());
        if (val !== 1) {
            $(this).next('input').val(val - 1).change();
        }
        return false;
    })

    $("#paymentSelectProvinces").select2({
        placeholder: 'Pilih Provinsi',
        language: 'id'
    })

    $("#paymentSelectRegencies").select2({
        placeholder: 'Pilih Kabupaten/Kota',
        language: 'id'
    })

    $("#paymentSelectKurir").select2({
        placeholder: 'Pilih Salah Satu',
        language: 'id'
    })

    $("#paymentSelectService").select2({
        placeholder: 'Pilih Service',
        language: 'id'
    })

    $("#paymentSelectProvinces").change(function() {
        $("#paymentSelectRegencies").select2({
            placeholder: 'Loading..',
            language: 'id'
        })
        const id = $(this).val();
        $.ajax({
            url: "<?= base_url(); ?>payment/getLocation",
            type: "post",
            dataType: "json",
            async: true,
            data: {
                id: id
            },
            success: function(data) {
                $("#paymentSelectRegencies").select2({
                    placeholder: 'Pilih Kabupaten/Kota',
                    language: 'id'
                })
                $("#paymentSelectRegencies").html(data);
                $("#paymentTextErrorAboveSelectKurir").hide();
            }
        });
    })

    $("#paymentSelectProvinces").change(paymentSelectKurir);

    $("#paymentSelectRegencies").change(paymentSelectKurir);

    function paymentSelectKurir() {
        $("#paymentSelectKurir").select2({
            placeholder: 'Loading..',
            language: 'id'
        })
        $("#paymentTotalAll").text("Rp" + '<?= number_format($totalall, 0, ",", "."); ?>');
        $("#paymentSendingPrice").text("Rp0");
        const destination = $("#paymentSelectRegencies").val();
        if (destination === "") {
            $("#paymentTextErrorAboveSelectKurir").show();
        } else {
            $("#paymentTextErrorAboveSelectKurir").hide();
            $.ajax({
                url: "<?= base_url(); ?>payment/getService",
                type: "post",
                dataType: "json",
                async: true,
                data: {
                    destination: destination,
                    id: "<?= $this->input->get('id') ?>",
                    qty: "<?= $this->input->get('qty') ?>",
                    segment: "<?= $this->uri->segment(1) ?>"
                },
                success: function(data) {
                    $("#paymentSelectKurir").select2({
                        placeholder: 'Pilih Salah Satu',
                        language: 'id'
                    })
                    $("#paymentSelectKurir").html(data);
                }
            });
        }
    }

    $("#paymentSelectKurir").change(paymentSelectService);

    function paymentSelectService() {
        let id = $("#paymentSelectKurir").val();
        id = id.split('-');
        id = id[0];
        if (id === "") {
            id = 0;
        }
        $("#paymentSendingPrice").text("Rp" + number_format(id).split(",").join("."));
        const price = $("#paymentPriceTotalAll").val();
        const total = parseInt(price) + parseInt(id);
        $("#paymentTotalAll").text("Rp" + number_format(total).split(",").join("."));
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
</script>

</html>