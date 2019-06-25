$(function () {
    // get menu
    $.ajax({
        url: '/api/v1/menu',
        type: 'GET',
        dataType: 'json',
        timeout: 5000,
    })
        .done(function (res) {
            // 通信成功時の処理を記述
            // console.debug(res)
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

    // get record
    $.ajax({
        url: '/api/v1/record',
        type: 'GET',
        dataType: 'json',
        timeout: 5000,
    })
        .done(function (res) {
            // divide date by category_id
            let a = function (category_id) {
                return function (v) {
                    return v["menu"]["category"]["category_id"] == category_id
                }
            }

            // set record by category
            $("#pushup_card").data("record", res.filter(a(1)))
            $("#squat_card").data("record", res.filter(a(2)))
            $("#pullup_card").data("record", res.filter(a(3)))
            $("#leg_raise_card").data("record", res.filter(a(4)))
            $("#bridge_card").data("record", res.filter(a(5)))
            $("#handstand_pushup_card").data("record", res.filter(a(6)))
        })
        .fail(function () {
            // 通信失敗時の処理を記述
            console.error("[!] Can't get record API error")
        });

    // modal open function
    function open_modal(record) {
        let $m = $("#modal_main_content")
        $m.empty()

        record.forEach(function (v, i) {
            $m.append(`<div>${v.date}|${v.count}|${v.menu.menu_name}</div>`)
        })
        $('#main_modal').modal('show')
    }

    // card shadow
    $(document).on({
        "mouseleave": function () {
            $(this).removeClass("shadow")
        },
        "mouseenter": function () {
            $(this).addClass("shadow")
        },
        "click": function () {
            let id = $(this).attr("id")
            let record = $(`#${id}`).data("record")
            open_modal(record)

        }
    }, ".category-card");
})
