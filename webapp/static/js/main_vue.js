const MENU_API = '/api/v1/menu'
const RECORD_API = '/api/v1/record'


Vue.component('menu_card',{
    props: ['card_title', 'img_path'],
    data: function() {
        return {
        }
    },
    methods: {
        open_modal: function(card_title) {
            console.log(`1 ${this.record_list}`)
            switch (this.card_title) {
                case "pushup_card":
                    this.current_modal_content_list = this.pushup_record_list
                    break
                case "squat_card":
                    this.current_modal_content_list = this.squat_record_list
                    break
                case "pullup_card":
                    this.current_modal_content_list = this.pullup_record_list
                    break
                case "leg_raise_card":
                    this.current_modal_content_list = this.leg_record_list
                    break
                case "bridge_card":
                    this.current_modal_content_list = this.bridge_record_list
                    break
                case "handstand_pushup_card":
                    this.current_modal_content_list = this.handstand_record_list
                    break
                default:
                    this.current_modal_content_list = []
            }

            $('#main_modal').modal('show')
        }
    },
    template: `
    <div class="p-2">
        <div :id="card_title"
            class="card category-card">
            <div class="card-header text-center">{{ card_title }}</div>
            <img :src="img_path" class="card-img">
        </div>
    </div>
    `
})


Vue.component('record-modal', {
    data: function() {
        return {
            modal_content: []
        }
    },
    methods: {
        build_modal: function(category_id) {
            
        }
    },
    template: `
    <!-- Modal -->
    <div id="main_modal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="modal_title" class="modal-title">Modal Title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="閉じる">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div><!-- /.modal-header -->
                <div class="modal-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>DATE</th>
                            <th>MENU(STEP)</th>
                            <th>COUNT</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr v-for="v in modal_content">
                                <td>{{ v.date }}</td>
                                <td>{{ v.menu.menu_name }}(STEP:{{ v.menu.menu_step }})</td>
                                <td>{{ v.count }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div><!-- /.modal-body -->
                <div class="modal-footer">
                    <!-- send log form -->
                    <form id="put-log-form" class="form-row" action="/api/v1/record" method="put">
                        <input id="put-date" type="date" class="col form-control">
                        <select id="put-menu-id" class="col form-control"></select>
                        <input id="put-count" type="number" class="col form-control">
                        <button type="submit" class="col btn btn-primary">Submit</button>
                    </form>
                </div><!-- /.modal-footer -->
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    `
})


var vm = new Vue({
    el: "#app",
    data : function() {
        return {
            debug: 'hello',
            menu_list: [],
            current_modal_content_list: [],
            record_list: [],
            pushup_record_list: [],
            squat_record_list: [],
            pullup_record_list: [],
            leg_record_list: [],
            bridge_record_list: [],
            handstand_record_list: []
        }
    },
    mounted: function() {
        axios
        .get(MENU_API)
        .then(res => {
            this.menu_list = res.data

            // debug
            console.log(`[+] menu_list. ${this.menu_list}`)
        })
        .catch(err => console.error(`[-] Miss to get menu. ${err}`))

        axios
        .get(RECORD_API)
        .then(res => {
            this.record_list = res.data

            let a = function (category_id) {
                return function (v) {
                    return v["menu"]["category"]["category_id"] == category_id
                }
            }

            this.pushup_record_list = this.record_list.filter(a(1))
            this.squat_record_list = this.record_list.filter(a(2))
            this.pullup_record_list = this.record_list.filter(a(3))
            this.leg_record_list = this.record_list.filter(a(4))
            this.bridge_record_list = this.record_list.filter(a(5))
            this.handstand_record_list = this.record_list.filter(a(6))

            // debug
            console.log(`[+] record_list. ${this.record_list}`)
        })
        .catch(err => console.error(`[-] Miss to get record. ${err}`))
    },
    delimiters: ['<%=', '%>']
})
