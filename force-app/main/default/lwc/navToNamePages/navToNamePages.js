import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class navToNamePages extends NavigationMixin(LightningElement) {

navigateToAccount(){
this[NavigationMixin.Navigate]({
    type:'standard__objectPage',
    attributes:{
        objectApiName:'Account',
        actionName:'new'
    }
})
}
navigateToAccountRecords(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Account',
            actionName:'list'
        }
    })
}
}