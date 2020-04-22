Vue.use(Vuex)

const MENU_API = '/api/v1/menu'
const RECORD_API = '/api/v1/record'


const store = new Vuex.Store({
    state: {
        menu_list: [],
        record_list: [],
        modal_content: [],
        select_content: [],
        card_category: "",
    },
    mutations: {
        set_menu(state, menu_list) {
            state.menu_list = menu_list
        },
        set_record(state, record_list) {
            state.record_list = record_list
        },
        set_category(state, card_category) {
            state.card_category = card_category
        }
    }
})


Vue.component('MainCard',{
    props: ['card_title', 'img_path'],
    methods: {
        open_modal: function() {
            store.commit("set_category", this.card_title)
            $('#main_modal').modal('show')
        },
    },
    template: `
        <div class="p-2">
            <div :id="card_title"
                class="card category-card"
                @click="open_modal">
                <div class="card-header text-center">{{ card_title }}</div>
                <img :src="img_path" class="card-img">
            </div>
        </div>`
})


Vue.component('RecordModal', {
    data: function() {
        return {
            pre_date: "",
            submit_date: "",
            submit_menu_id: 5,
            submit_count: ""
        }
    },
    methods: {
        filter_record: function(record_list, card_title) {
            let filtered_record_list = record_list.filter(function(v) {
                return v["menu"]["category"]["category_name"] + "_card" == card_title
            })
            return filtered_record_list
        },
        filter_menu: function(menu_list, card_title) {
            let filtered_menu_list = menu_list.filter(function(v) {
                return v["category_name"] + "_card" == card_title
            })
            return filtered_menu_list[0]["menu"]
        },
        isHead: function(next_date) {
            let result = this.pre_date !== next_date
            this.pre_date = next_date
            return result
        },
        submit_log: function(event) {
            // cancel submit form
            event.preventDefault()

            let submit_data = {
                date: this.submit_date,
                menu_id: this.submit_menu_id,
                count: this.submit_count
            }

            // reload
            axios
            .put(RECORD_API, submit_data)
            .then(res => {
                axios
                .get(RECORD_API)
                .then(res => {
                    store.commit("set_record", res.data)
                })
                .catch(err => console.error(`[-] Miss to get record. ${err}`))

            })
            .catch(err => {
                console.error(`[!] failed submit... ${err.data}`)
            })
        }
    },
    computed: {
        card_title() {
            return store.state.card_category
        },
        selected_record_list() {
            let r = store.state.record_list
            let c = store.state.card_category

            return this.filter_record(r, c)
        },
        selected_menu_list() {
            let m = store.state.menu_list
            let c = store.state.card_category

            return this.filter_menu(m, c)
        }
    },
    template: `
        <!-- Modal -->
        <div id="main_modal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="modal_title" class="modal-title">{{ card_title }}</h5>
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
                                <tr v-for="v in selected_record_list" :class="{ record_head_of_date: isHead(v.date) }">
                                    <td>{{ v.date }}</td>
                                    <td>{{ v.menu.menu_name }}(STEP:{{ v.menu.menu_step }})</td>
                                    <td>{{ v.count }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div><!-- /.modal-body -->
                    <div class="modal-footer">
                        <!-- send log form -->
                        <form id="put-log-form" class="form-row">
                            <input v-model="submit_date" type="date" class="col form-control">
                            <select v-model="submit_menu_id" class="col form-control">
                                <option v-for="v in selected_menu_list" :value="v.menu_id">
                                    {{ v.menu_name }}(STEP: {{ v.menu_step }})
                                </option>
                            </select>
                            <input v-model="submit_count" type="number" class="col form-control">
                            <button type="submit" @click="submit_log" class="col btn btn-primary">Submit</button>
                        </form>
                    </div><!-- /.modal-footer -->
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->` 
})


var vm = new Vue({
    el: "#app",
    mounted: function() {
        this.refresh()
    },
    methods: {
        refresh() {
            axios
            .get(MENU_API)
            .then(res => {
                store.commit("set_menu", res.data)
            })
            .catch(err => console.error(`[-] Miss to get menu. ${err}`))

            axios
            .get(RECORD_API)
            .then(res => {
                store.commit("set_record", res.data)
            })
            .catch(err => console.error(`[-] Miss to get record. ${err}`))
        }
    },
    delimiters: ['<%=', '%>']
})
