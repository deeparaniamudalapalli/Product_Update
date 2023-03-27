import { LightningElement, track } from 'lwc';
import getContactRecords from '@salesforce/apex/showContactscntl.getContacts';
export default class ShowContactcmpCtrl extends LightningElement {
    @track lstcontact;
    @track error;
    getContactRec()
    {
        console.log('test1');
        getContactRecords()
        .then(result => {
this.lstcontact = result;
        })
        
    }
}