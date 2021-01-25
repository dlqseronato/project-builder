CKEDITOR.plugins.add( 'timestamp', {
  icons: 'timestamp',
  init: function( editor ) {
    //Plugin logic goes here.
    editor.addCommand( 'insertTimestamp', {
      exec: function( editor ) {
        var now = new Date();
        editor.insertHtml( 'The current date and time is: <em>' + now.toString() + '</em>' );
      }
    });

    //Creating the Toolbar Button
    editor.ui.addButton( 'Timestamp', {
      label: 'Insert Timestamp',
      command: 'insertTimestamp',
      toolbar: 'insert'
    });
  }
});
