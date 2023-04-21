import moment from 'moment'

const WEEK = [
    '日',
    '一',
    '二',
    '三',
    '四',
    '五',
    '六'
]

export default class DateInfo {
    taskIsDone: boolean = false
    taskDoneTime: string = null

    constructor(done:boolean,time:string) {
        this.taskIsDone = done
        this.taskDoneTime = time
    }
    getTime(){
        return moment(this.taskDoneTime, 'YYYY-MM-DD HH:mm:ss')
    }

    getWeek(): string {
        let time = moment(this.taskDoneTime, 'YYYY-MM-DD HH:mm:ss')
        return WEEK[time.weekday()]
    }

    getDay(): string {
        let dayInMonth = this.taskDoneTime.split(' ')[0].split('-')[2]
        return dayInMonth
    }
    isDone():boolean{
        return this.taskIsDone
    }
}