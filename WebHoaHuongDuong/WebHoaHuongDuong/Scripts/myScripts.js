function UploadFile() {
    //we can create form by passing the form to Constructor of formData object
    //or creating it manually using append function
    //but please note file name should be same like the action Parameter
    var dataString = new FormData();
    var selectedFile = ($("#UploadedFile"))[0].files[0];//FileControl.files[0];
    if (!selectedFile) {
        return;
    }
    dataString.append("UploadedFile", selectedFile);

    $.ajax({
        url: '/Admin/Product/Upload',  //Server script to process data
        type: 'POST',
        xhr: function () {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { // Check if upload property exists
                //myXhr.upload.onprogress = progressHandlingFunction
                myXhr.upload.addEventListener('progress', progressHandlingFunction,
                false); // For handling the progress of the upload
            }
            return myXhr;
        },
        //Ajax events
        success: successHandler,
        error: errorHandler,
        // Form data
        data: dataString,
        //Options to tell jQuery not to process data or worry about content-type.
        cache: false,
        contentType: false,
        processData: false
    });
}

function successHandler(data) {
    $("#Thumbnail").val(data);

    if (data != '') {
        $("#messageUpload").text("Upload file thành công!");
        $('input[name="Image"]').val(data);
    } else {
        $("#messageUpload").text("Upload file thất bại. Vui lòng thử lại!");
    }
}

function errorHandler(data) {
    $("#messageUpload").text("Upload file thất bại. Vui lòng thử lại!");
}

function progressHandlingFunction(e) {
    if (e.lengthComputable) {
        var percentComplete = Math.round(e.loaded * 100 / e.total);
        $("#FileProgress").css("width",
        percentComplete + '%').attr('aria-valuenow', percentComplete);
        $('#FileProgress span').text(percentComplete + "%");
    }
    else {
        $('#FileProgress span').text('unable to compute');
    }
}


function ImportProduct() {
    //we can create form by passing the form to Constructor of formData object
    //or creating it manually using append function
    //but please note file name should be same like the action Parameter
    var dataString = new FormData();
    var selectedFile = ($("#UploadedFile"))[0].files[0];//FileControl.files[0];
    if (!selectedFile) {
        return;
    }
    dataString.append("UploadedFile", selectedFile);

    $.ajax({
        url: "/Product/Upload",  //Server script to process data
        type: "POST",
        xhr: function () {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { // Check if upload property exists
                //myXhr.upload.onprogress = progressHandlingFunction
                myXhr.upload.addEventListener('progress', progressHandlingFunction,
                false); // For handling the progress of the upload
            }
            return myXhr;
        },
        //Ajax events
        success: successProductImportHandler,
        error: errorHandler,
        // Form data
        data: dataString,
        //Options to tell jQuery not to process data or worry about content-type.
        cache: false,
        contentType: false,
        processData: false
    });
}

function successProductImportHandler(data) {
    if (data != '') {
        $("#messageUpload").text("Import file thành công!");
        location.href = "../Product/Index";
    } else {
        $("#messageUpload").text("Import file thất bại. Vui lòng thử lại!");
    }
}