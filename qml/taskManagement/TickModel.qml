import QtQuick 1.1

BaseTaskModel {
    id: tListModel

    Component.onCompleted: fetch()

    function set(name, done) {
        var db = getDb();
        var res = "";
        db.transaction(function(tx) {
               var rs = tx.executeSql('UPDATE tasklist SET done=? WHERE name=?', [done, name]);
               if (rs.rowsAffected > 0) {
                   res = "OK";
               } else {
                   res = "Error";
               }
           }
        );
        // The function returns “OK” if it was successful, or “Error” if it wasn't
        return res;
    }

    function fetch() {
        var db = getDb();
        var res="";
        db.transaction(function(tx) {
                           var rs = tx.executeSql('SELECT * FROM tasklist;');
                           if (rs.rows.length > 0) {
                               for (var i=0; i<rs.rows.length; i++) {
                                   tListModel.append({"name": rs.rows.item(i).name,
                                                       "done": rs.rows.item(i).done});
                               }
                               res = "Ok";
                           } else {
                               res = "Unknown";
                           }
                       });
        return res
    }

    function save() {
        for (var i=0; i<tListModel.count; i++) {
            set(tListModel.get(i).name, tListModel.get(i).done);
        }
    }

    function getTotalScore() {
        var db = getDb();
        var rs="";
        db.transaction(function(tx) {
            rs = tx.executeSql("SELECT sum(point) AS theSum FROM tasklist WHERE done=1");
        });
        return rs.rows.item(0).theSum*1;
    }
}
