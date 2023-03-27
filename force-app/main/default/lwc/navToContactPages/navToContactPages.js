import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'

export default class navToNamePages extends NavigationMixin(LightningElement){
navigateToContact(){
    this[NavigationMixin.Navigate]({
        type:'standard__objectPage',
        attributes:{
            objectApiName:'Contact',
            actionName:'new'
        }
    })
    }
    navigateToContactRecords(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Contact',
                actionName:'list'
            }
        })
    }
}