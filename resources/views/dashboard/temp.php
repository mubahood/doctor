<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>


  
 
 
</head>

<body>

 



    <div class="container m-5 p-5">

        <div class="row">
            <div class="col-md-12">
                <div class="form-group border rounded p-5">
                    <label for="pic">Profile pic</label>
                    <input class="form-control">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group border rounded p-5">
                    <label for="pic">Profile pic</label>
                    <input class="form-control" type="file" id="input-100" name="input-100[]" accept="image/*" multiple>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group border rounded p-5">
                    <label for="pic">Profile pic</label>
                    <input class="form-control">
                </div>
            </div>
        </div>
    </div>
 

    <script src="http://127.0.0.1:8000/vendor/laravel-admin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://127.0.0.1:8000/vendor/laravel-admin/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js">
    </script>
    <script src="http://127.0.0.1:8000/vendor/laravel-admin/bootstrap-fileinput/js/fileinput.min.js?v=4.5.2"></script>
    <script
        src="http://127.0.0.1:8000/vendor/laravel-admin/fontawesome-iconpicker/dist/js/fontawesome-iconpicker.min.js">
    </script>
    <script src="http://127.0.0.1:8000/vendor/laravel-admin/bootstrap-fileinput/js/plugins/sortable.min.js?v=4.5.2">
    </script>
 



</body>

</html>


<script>
    window.addEventListener('DOMContentLoaded', (event) => {

        $("#input-100").fileinput({
            uploadUrl: "http://localhost/file-upload.php",
            enableResumableUpload: true,
            resumableUploadOptions: {
               // uncomment below if you wish to test the file for previous partial uploaded chunks
               // to the server and resume uploads from that point afterwards
               // testUrl: "http://localhost/test-upload.php"
            },
            uploadExtraData: {
                'uploadToken': 'SOME-TOKEN', // for access control / security 
            },
            maxFileCount: 5,
            allowedFileTypes: ['image'],    // allow only images
            showCancel: true,
            initialPreviewAsData: true,
            overwriteInitial: false,
            // initialPreview: [],          // if you have previously uploaded preview files
            // initialPreviewConfig: [],    // if you have previously uploaded preview files
            theme: 'fas',
            deleteUrl: "http://localhost/file-delete.php"
        }).on('fileuploaded', function(event, previewId, index, fileId) {
            console.log('File Uploaded', 'ID: ' + fileId + ', Thumb ID: ' + previewId);
        }).on('fileuploaderror', function(event, data, msg) {
            console.log('File Upload Error', 'ID: ' + data.fileId + ', Thumb ID: ' + data.previewId);
        }).on('filebatchuploadcomplete', function(event, preview, config, tags, extraData) {
            console.log('File Batch Uploaded', preview, config, tags, extraData);
        });
 
        
         
    });
</script>