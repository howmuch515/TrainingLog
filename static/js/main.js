$(function () {
    // get menu
    $.ajax({
        url: '/api/v1/menu',
        type: 'GET',
        dataType: 'json',
        timeout: 5000,
        async: false
    })
        .done(function (res) {
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
        async: false
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
    function open_modal(title, record) {
        let $mt = $("#modal_title")
        let $m = $("#modal_main_content")
        $mt.empty()
        $m.empty()

        $mt.append(title)
        record.forEach(function (v, i) {
            $m.append(`<tr><td>${v.date}</td><td>${v.menu.menu_name}(STEP:${v.menu.menu_step})</td><td>${v.count}</td></tr>`)
        })
        $('#main_modal').modal('show')
    }

    // card shadow
    $(document).on(
        {
            "mouseleave": function () {
                $(this).removeClass("shadow")
            },
            "mouseenter": function () {
                $(this).addClass("shadow")
            },
            "click": function () {
                let id = $(this).attr("id")
                let record = $(`#${id}`).data("record")
                open_modal(id, record)

            }
        }, ".category-card");

    // PUT log
    $(document).on(
        {
            "submit": function (e) {
                // cancel submit form
                e.preventDefault()

                let json_data = {
                    date: $("#put-date").val(),
                    menu_id: $("#put-menu-id").val(),
                    count: $("#put-count").val()
                }

                // put log data
                let $f = $(this)
                $.ajax({
                    url: $f.attr("action"),
                    type: $f.attr("method"),
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(json_data),
                    timeout: 5000,
                })
                    .done(function (res) {
                        console.debug(res)
                    })
                    .fail(function (err) {
                        console.debug(err)
                    })

            }
        }, "#put-log-form");
})
