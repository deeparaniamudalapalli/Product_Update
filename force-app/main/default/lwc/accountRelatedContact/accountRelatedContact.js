import { LightningElement,track,api} from 'lwc';
import getContactRecords from '@salesforce/apex/showRelatedContact.getContacts' ;
export default class AccountRelatedContact extends LightningElement {
    @api recordId;
    @track lstContact;
    @track error;
    
     getContactRec()
    {
        console.log ('test1');
        getContactRecords( { accRecordId: this.recordId})
        .then(result => {
            this.lstContact = result;
            console.log ('test12');
        })
       
        .catch(error => {
this.error = error;
        });
        
        
    }
}