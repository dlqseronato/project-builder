CKEDITOR.plugins.add( 'cyberaddfield', {
  icons: 'cyberaddfield',
  init: function( editor ) {
    editor.addCommand( 'openModal', {
      exec: function( editor ) {
        editor.insertHtml("{{cyberfield}}");
        var uri = location.href;
        location.href= uri + '?CKEditorModal=true';
        location.href=uri;
      }
    });
    editor.ui.addButton( 'cyberaddfield', {
      label: 'CyberField',
      command: 'openModal',
      toolbar: 'cyberfinancial'
    });
  }
});
