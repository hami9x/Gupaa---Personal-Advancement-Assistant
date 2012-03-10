import QtQuick 1.1
import "taskManagement"

BaseTaskModel {
    id: scoreModel

    function getTotalScore() {
        var db = getDb();
        var rs="";
        db.transaction(function(tx) {
            rs = tx.executeSql("SELECT sum(point) AS theSum FROM tasklist WHERE done=1");
        });
        return rs.rows.item(0).theSum*1;
    }

    function getFullScore() {
        var db = getDb();
        var rs="";
        db.transaction(function(tx) {
            rs = tx.executeSql("SELECT sum(point) AS theSum FROM tasklist");
        });
        return rs.rows.item(0).theSum*1;
    }

    function clearTicks() {
        var db = getDb();
        db.transaction(function(tx) {
           tx.executeSql("UPDATE tasklist SET done=0");
        });
    }
}
