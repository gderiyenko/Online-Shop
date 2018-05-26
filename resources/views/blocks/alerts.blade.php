<!-- html -->
<div id="product-added" class="row">
    <div id="was-added" class="m-alert m-alert--icon m-alert--outline alert alert-success alert-dismissible fade " role="alert">
        <div class="m-alert__icon">
            <i class="la la-warning"></i>
        </div>
        <div class="m-alert__text">
            <strong>
                Well done!
            </strong>
            You successfully added this product to your basket.
        </div>
        <div class="m-alert__close">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</div>

<!-- scripts -->

<script>
function showAddingAlert() {
    var x = document.getElementById("was-added");
    x.className = "m-alert m-alert--icon m-alert--outline alert alert-success alert-dismissible fade show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
}
</script>
