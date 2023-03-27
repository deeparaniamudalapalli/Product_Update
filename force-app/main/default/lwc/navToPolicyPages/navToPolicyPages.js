import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class navToPolicyPages extends NavigationMixin(LightningElement) {

navigateToPolicy(){
this[NavigationMixin.Navigate]({
    type:'standard__objectPage',
    attributes:{
        objectApiName:'Policy__c',
        actionName:'new'
    }
})
}
navigateToPolicyRecords(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Policy__c',
            actionName:'list'
        }
    })
}
}