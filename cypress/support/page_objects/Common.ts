export default class Common {
  state: any = {};
  elements = {
    // iconEye: () => cy.get('.absolute'),
    iconEye: (text: string, number: number) => cy.get('#Layer_1.absolute').eq(number),
    textDashboard: (text: string) => cy.get('#name-application').contains(text),
    textTitle: () => cy.title(),
    textForgotPasswordButton: (text: string) => cy.get('.text-blue-600').contains(text),
    textTitleForgotPassword: (text: string) => cy.get('.ant-modal-title').contains(text),
    reloadPage: () => cy.reload(),
    clearInputByName: (text: string) => cy.get('.ant-select-clear'),
    // forItemEye: (name: string) => cy.get('#Layer_1')
    // forItemByName: (name: string) => cy.contains('.ant-form-item-label > label', name).parent().parent(),
    // inputByName: (name: string) => this.elements.forItemByName(name).find('input'),
    //---------------------------------------------------------------------------------------------
    textButton: (text: string) => cy.get(`button[title="${text}"]`).should('not.be.disabled'),
    textMenu: (text: string) => cy.get('li.menu').contains(text),
    textSubMenu: (text: string) => cy.get('a.sub-menu').contains(text),
    textTabBtn: (text: string) => cy.get('.ant-tabs-tab-btn').contains(text),
    tableByName: (val: string) => cy.get('.ant-table-cell').contains(val),
    buttonTableByName: (val: string, text: string) =>
      this.elements.tableByName(val).parents('tr').find(`button[title="${text}"]`),
    itemByName: (val: string) => cy.get('.item-text').contains(val).parents('.item'),
    buttonItemByName: (val: string, text: string) => this.elements.itemByName(val).find(`button[title="${text}"]`),
    buttonConfirmPopover: () => cy.get('.ant-popover .ant-btn-primary'),
    messageSwal2: () => cy.get('div#swal2-html-container'),

    forItemByName: (name: string) => cy.contains('.ant-form-item-label > label', name).parent().parent(),
    inputByName: (name: string) => this.elements.forItemByName(name).find('input'),
    textareaByName: (name: string) => this.elements.forItemByName(name).find('textarea'),
    editorByName: (name: string) => this.elements.forItemByName(name).find('.ce-paragraph'),
    editorHtmlByName: (name: string) => this.elements.forItemByName(name).find('.note-editable'),
    fileByName: (name: string) => this.elements.forItemByName(name).find('input[type=file]'),
    pickerInputByName: (name: string) => this.elements.forItemByName(name).find('.ant-picker-input input'),
    switchByName: (name: string) => this.elements.forItemByName(name).find('.ant-switch'),
    radioByName: (name: string, text: string) =>
      this.elements.forItemByName(name).find('.ant-radio-wrapper-in-form-item').contains(text),
    selectByName: (name: string) =>
      this.elements.forItemByName(name).find('.ant-select').click().find('.ant-select-selection-search-input'),
    inputByPlaceholder: (placeholder: string) => cy.get(`input[placeholder="${placeholder}"]`),
    errorByName: (name: string) => this.elements.forItemByName(name).find('.ant-form-item-explain-error'),

    checkboxWrapper: (text: string) => cy.get(`.ant-checkbox-wrapper`).contains(text),
    buttonRightTransfer: () => cy.get(`.ant-transfer-operation button`).eq(1),
    treeSelectByName: (name: string) => this.elements.forItemByName(name).find('.ant-tree-select'),
    treeSelectSelectionTitle: (title: string) => cy.get(`.ant-select-tree-node-content-wrapper[title='${title}']`),
    treeByName: (val: string) => cy.get(`.ant-tree-node-content-wrapper[title="${val}"]  > .group`),
    removeTreeByName: (val: string) => this.elements.treeByName(val).find('.la-trash'),
  };
  spin = () => {
    cy.wait(200);
    cy.$$('.ant-spin-spinning').length && cy.get('.ant-spin-spinning').should('not.exist', { timeout: 10000 });
  };
  clickSubmitPopover = () =>
    cy
      .wait(0)
      .then(() => cy.$$('.ant-popover .ant-btn-primary').length && this.elements.buttonConfirmPopover().click());

  clickTextButton = (text: string) => {
    this.elements.textButton(text).click();
    this.clickSubmitPopover();
  };
  //------------------------------------------------------------------------
  validDashboard = (text: string) => this.elements.textDashboard(text).should('have.text', text);
  validTextMenu = (text: string) => this.elements.textMenu(text).should('have.text', text);
  validtextTitle = (text: string) => this.elements.textTitle().should('include', text);
  ClickForgotPassword = (text: string) => this.elements.textForgotPasswordButton(text).click();
  validTitleForgotPassword = (text: string) => this.elements.textTitleForgotPassword(text).should('have.text', text);
  ClickEyeIcon = (text: string, number: number) => this.elements.iconEye(text, number).click();
  DisplayPassword = (name: string) => this.elements.inputByName(name).should('have.attr', 'type', 'text');
  ReloadPage = () => this.elements.reloadPage();
  emptyInputByName = (name: string) => this.elements.inputByName(name).should('be.empty');
  ClickClearInputByName = (text: string) => this.elements.clearInputByName(text).click();
  //-------------------------------------------------------------------------
  clickTextMenu = (text: string) => this.elements.textMenu(text).click();
  clickTextSubMenu = (text: string, url: string) => {
    this.spin();
    this.elements.textSubMenu(text).click();
    cy.url().should('include', url);
  };
  clickTextTabBtn = (text: string) => this.elements.textTabBtn(text).click();
  clickButtonTableByName = (text: string, name: string) => {
    this.spin();
    this.elements.buttonTableByName(this.state[name], text).click();
    this.clickSubmitPopover();
  };
  clickItemByName = (text: string) => this.elements.itemByName(text).click();
  clickButtonItemByName = (text: string, name: string) => {
    this.spin();
    this.elements.buttonItemByName(this.state[name], text).click();
    this.clickSubmitPopover();
  };

  verifyMessageSwal2 = (message: string) => {
    if (message.indexOf('_@') > -1 && message.indexOf('@_') > -1) {
      const arrayValue = message.match(/(_@[A-Z])\w+\s+\w+@_/g);
      arrayValue?.forEach((text, index) => {
        message = message.replace(text, this.state[text.replace('_@', '').replace('@_', '')]);
        if (arrayValue?.length - 1 === index) this.elements.messageSwal2().should('have.text', message);
      });
    } else this.elements.messageSwal2().should('have.text', message);
    cy.get('.swal2-confirm').then((button) => !!button && button.click());
  };

  typeInputByName = (type: inputType, name: string, text: string) => {
    const input = this.elements.inputByName(name).typeRandom(text, this.state, type);
    if (text) input.invoke('val').then((val) => (this.state[name] = val));
  };
  typeTextareaByName = (type: inputType, name: string, text: string) => {
    const input = this.elements.textareaByName(name).typeRandom(text, this.state, type);
    if (text) input.invoke('val').then((val) => (this.state[name] = val));
  };
  typeEditorByName = (type: inputType, name: string, text: string) => {
    const input = this.elements.editorByName(name).typeRandom(text, this.state, type);
    if (text) input.invoke('val').then((val) => (this.state[name] = val));
  };
  typeEditorHtmlByName = (type: inputType, name: string, text: string) => {
    const input = this.elements.editorHtmlByName(name).typeRandom(text, this.state, type);
    if (text) input.invoke('val').then((val) => (this.state[name] = val));
  };
  typeInputByPlaceholder = (type: inputType, placeholder: string, text: string) => {
    const input = this.elements.inputByPlaceholder(placeholder).typeRandom(text, this.state, type);
    if (text) input.invoke('val').then((val) => (this.state[placeholder] = val));
  };
  selectFileByName = (name: string, text: string) =>
    this.elements.fileByName(name).selectFile(
      text.split(',').map((item) => 'cypress/upload/' + item),
      { force: true },
    );
  typePickerInputByName = (name: string, text: string) =>
    this.elements.pickerInputByName(name).click().typeRandom(text, this.state, 'date');
  clickSwitchByName = (name: string) => this.elements.switchByName(name).click();
  clickRadioByName = (text: string, name: string) => this.elements.radioByName(name, text).click();
  clickSelectByName = (name: string, text: string) => {
    const newText =
      text.indexOf('_@') > -1 && text.indexOf('@_') > -1 ? this.state[text.replace('_@', '').replace('@_', '')] : text;
    this.elements.selectByName(name).type(newText);
    window.scrollY > 0 && cy.scrollTo('top');
    cy.get(`.ant-select-item-option[title='${newText}']`).should('be.visible').click();
  };
  verifyErrorByName = (name: string, text: string) => this.elements.errorByName(name).should('have.text', text);

  clickCheckboxWrapper = (list: string) => {
    list.split(', ').forEach((item: string) => this.elements.checkboxWrapper(item).click());
    this.elements.buttonRightTransfer().click();
  };
  clickTreeSelectByName = (name: string, text: string) => {
    const newText =
      text.indexOf('_@') > -1 && text.indexOf('@_') > -1 ? this.state[text.replace('_@', '').replace('@_', '')] : text;
    this.elements.treeSelectByName(name).type(newText);
    this.elements.treeSelectSelectionTitle(newText).then((e) => {
      cy.get('.ant-select-tree-list-holder-inner').scrollIntoView({ offset: { top: e[0].offsetTop, left: 0 } });
      this.elements.treeSelectSelectionTitle(newText).should('be.visible').click();
    });
  };
  clickTreeByName = (name: string) => {
    this.spin();
    this.elements.treeByName(this.state[name].toString()).click();
  };
  clickRemoveTreeByName = (name: string) => {
    this.spin();
    this.elements.removeTreeByName(this.state[name]).click({ force: true });
    this.clickSubmitPopover();
  };
}
type inputType = 'test name' | 'text' | 'word' | 'paragraph' | 'number' | 'email' | 'percentage' | 'color' | 'phone';
