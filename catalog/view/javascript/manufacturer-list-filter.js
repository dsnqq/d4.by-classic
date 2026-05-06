(function($) {
    var fallbackMap = window.MF_MANUFACTURER_PARENT_FALLBACK || {};

    function parseId(value) {
        var parsed = parseInt(value, 10);
        return isNaN(parsed) ? null : parsed;
    }

    function getIdsForSelection(parentId) {
        var ids = {};
        var children = fallbackMap[parentId] || [];

        ids[parentId] = parentId;

        for (var i = 0; i < children.length; i++) {
            var childId = parseId(children[i]);
            if (childId !== null) {
                ids[childId] = childId;
            }
        }

        return Object.keys(ids);
    }

    function checkManufacturerGroup(parentId) {
        var ids = getIdsForSelection(parentId);
        $('.mfilter-manufacturer-list').find('input[name^="manufacturers"]').prop('checked', false);

        for (var i = 0; i < ids.length; i++) {
            $('[data-keys="' + ids[i] + '"]').prop('checked', true);
        }
    }

    $('body').on('change', '.manufacture-pick', function() {
        var thisValue = parseId($(this).find('option:selected').data('key'));
        $('.mfilter-manufacturer-list').find('input[name^="manufacturers"]').prop('checked', false);

        if (thisValue === null) {
            return;
        }

        checkManufacturerGroup(thisValue);
    });

    $(document).ready(function() {
        $.each(fallbackMap, function(parentId, childrenIds) {
            var allChecked = true;
            var ids = {};
            var numericParentId = parseId(parentId);

            if (numericParentId === null) {
                return;
            }

            ids[numericParentId] = numericParentId;

            for (var i = 0; i < childrenIds.length; i++) {
                var childId = parseId(childrenIds[i]);
                if (childId !== null) {
                    ids[childId] = childId;
                }
            }

            $.each(ids, function(_, id) {
                if (!$('[data-keys="' + id + '"]').is(':checked')) {
                    allChecked = false;
                    return false;
                }
            });

            if (allChecked) {
                $('[data-key="' + numericParentId + '"]').prop('selected', true);
            }
        });
    });
})(jQuery);
