const MENU_API = '/api/v1/menu'
const RECORD_API = '/api/v1/record'

var vm = new Vue({
    el: "#app",
    data : function() {
        return {
            menu_list: [],
            record_list: []
        }
    },
    mounted: function() {
        axios
        .get(MENU_API)
        .then(res => this.menu_list = res.data)
        .catch(err => console.error(`[-] Miss to get menu. ${err}`))

        axios
        .get(RECORD_API)
        .then(res => this.record_list = res.data)
        .catch(err => console.error(`[-] Miss to get record. ${err}`))

        // debug
        console.log(`[+] menu_list. ${this.menu_list}`)
        console.log(`[+] record_list. ${this.record_list}`)
    },
    delimiters: ['<%=', '%>']
})