$(function () {
    // get record
    $.ajax({
        url: '/api/v1/record',
        type: 'GET',
        dataType: 'json',
        timeout: 5000,
    })
        .done(function (res) {
            // 通信成功時の処理を記述
            console.debug(res)
        })
        .fail(function () {
            // 通信失敗時の処理を記述
            console.error("[!] Can't get record API error")
        });

    // get menu
    $.ajax({
        url: '/api/v1/menu',
        type: 'GET',
        dataType: 'json',
        timeout: 5000,
    })
        .done(function (res) {
            // 通信成功時の処理を記述
            console.debug(res)
            res.forEach(function (v, i) {
                if (i === 3) {
                    $("#card_board").append('<div class="w-100"></div>')
                }
                let card_html_format = `<div class="col-sm">
                                                    <div id="${v.category_name}_card"
                                                        class="card category-card m-5">
                                                        <div class="card-header">${v.category_name}</div>
                                                        <div class="card-body">
                                                            <div class="card-text">${v.category_name}</div>
                                                        </div>
                                                    </div>
                                                </div>`
                $("#card_board").append(card_html_format);
            });
        })
        .fail(function () {
            // 通信失敗時の処理を記述
            console.error("[!] Can't get menu API error")
        });

    // card shadow
    $(document).on({
        "mouseleave": function () {
            $(this).removeClass("shadow")
        },
        "mouseenter": function () {
            $(this).addClass("shadow")
        },
        "click": function () {
            $('#main_modal').modal('show')
        }
    }, ".category-card");
})
