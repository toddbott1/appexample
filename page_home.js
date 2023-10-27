function showSearchFilters ()

{

    document.getElementById("showfilters").style.display = "none";

    document.getElementById("hidefilters").style.display = "block";

    document.getElementById("PICK_TYPE_CONTAINER").style.display="block";

    document.getElementById("PICK_OWNER_CONTAINER").style.display="block";

    document.getElementById("PICK_CATEGORY_CONTAINER").style.display="block";

    document.getElementById("PICK_STATUS_CONTAINER").style.display="block";

}

function hideSearchFilters (hideAll = false)

{

    const showBtn = document.getElementById("showfilters");

    hideAll ? (showBtn.style.display = "none") : (showBtn.style.display = "block");

    document.getElementById("hidefilters").style.display = "none";

    document.getElementById("PICK_TYPE_CONTAINER").style.display="none";

    document.getElementById("PICK_OWNER_CONTAINER").style.display="none";

    document.getElementById("PICK_CATEGORY_CONTAINER").style.display="none";

    document.getElementById("PICK_STATUS_CONTAINER").style.display="none";

}

function showSPADialog (e) {

    document.getElementById("t_Header").style.display = "none";

    document.getElementById("searchitems").style.display = "none";

    hideSearchFilters(true);

    document.getElementById("mainreport").style.display = "none";

    document.getElementById("createitem").style.display = "none";

    document.getElementById("edititems").style.display = "none";

    document.getElementById("shareitems").style.display = "none";

    document.getElementById("exportitems").style.display = "none";

    document.getElementById("deleteitems").style.display = "none";

    e.style.display = "block";

}

function hideSPADialog () {

    document.getElementById("t_Header").style.display = "block";

    document.getElementById("searchitems").style.display = "block";

    hideSearchFilters(false);

    document.getElementById("mainreport").style.display = "block";

    document.getElementById("createitem").style.display = "none";

    document.getElementById("edititems").style.display = "none";

    document.getElementById("shareitems").style.display = "none";

    document.getElementById("exportitems").style.display = "none";

    document.getElementById("deleteitems").style.display = "none";

}