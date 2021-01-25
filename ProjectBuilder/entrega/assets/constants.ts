import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class Constants {
  constructor() { }

  public static WHITE_LISTED_DOMAINS(): string[]{
    return ["https://172.19.3.12:8443/cyberconsole/api/v9", "https://172.19.3.12:8443/conppwPadraoC9-war", "http://localhost:4200/conppwPadraoC9-war"];
  }

  public static BLACK_LISTED_DOMAINS(): string[]{
    return [];
  }
  public static get DEFAULT_PAGE_SIZE(): number {
    return 10;
  }

  static readonly PARAM_TABLE_ID_GOJS = '5060';

  public static get TOKEN_RENEWAL_INTERVAL(): number {
    return 120000;
  }

  public static get OPEN_BUTTON(): any {
    return {
      type: 'grid.open',
      icon: 'fa fa-folder-open',
      class: 'btn btn-primary btn-table'
    };
  }

  public static get VIEW_BUTTON(): any {
    return {
      type: 'grid.view',
      icon: 'fa fa-eye',
      class: 'btn btn-primary btn-table'
    };
  }

  public static get EDIT_BUTTON(): any {
    return {
      type: 'grid.edit',
      icon: 'fa fa-pencil',
      class: 'btn btn-primary btn-table'
    };
  }

  public static get DELETE_BUTTON(): any {
    return {
      type: 'grid.delete',
      icon: 'fa fa-trash',
      class: 'btn btn-danger btn-table'
    };
  }

  public static get CHANGE_PASSWORD(): any {
    return {
      type: 'grid.changePassword',
      icon: 'fas fa-unlock-alt',
      class: 'btn btn-primary btn-table'
    };
  }

  public static get SESSION_STORAGE_KEYS(): any {
    return {
      TOKEN: 'auth-token',
      ERCODE: 'erCode',
      BREADCRUMB_STATES: 'breadcrumb-states'
    };
  }

  public static get ERROR_MESSAGE_DOWNLOAD(): string {
    return 'validation.fileNotFound';
  }

  public static readonly GENERIC_GROUP = '*';
  public static readonly GENERIC_QUEUE = '*';
  public static readonly ACTION_CODE = 'A';
  public static readonly RESULT_CODE = 'R';
  public static readonly LETTER_CODE = 'L';
  public static readonly LEGAL_GROUP = 'j';
} 
