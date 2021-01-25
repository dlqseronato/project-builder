CKEDITOR.plugins.add( 'cyberimage', {
  icons: 'cyberimage',
  init: function( editor ) {
    editor.addCommand( 'addcyberimage', {
      exec: function( editor ) {
        editor.insertHtml("{{ckimagereplace}}");
        var uri = location.href;
        location.href= uri + '?CKEditorImage=true';
        location.href=uri;
      },
    });
    editor.ui.addButton( 'cyberimage', {
      label: 'Add Image From Server',
      command: 'addcyberimage',
      toolbar: 'cyberfinancial'
    });
  }
});
