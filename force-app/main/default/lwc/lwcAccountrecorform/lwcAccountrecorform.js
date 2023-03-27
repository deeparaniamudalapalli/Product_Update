import { LightningElement,api, track} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';

export default class LwcAccountrecorform extends LightningElement {
   fields = [NAME_FIELD];


    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName;
}