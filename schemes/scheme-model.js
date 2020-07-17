const db = require("../data/db-config.js")

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}
//<:<:<:<:<:<: GET :>:>:>:>:>:>\\
function find() {
    return db("schemes")
}

function findById(id) {
    return db("schemes")
        .where({ id })
        .first()
}

function findSteps(steps_id) {
    return db("schemes as s")
        .join("steps as st", "st.scheme_id", "s.id" )
        .select("st.id", "s.scheme_name", "st.instructions")
        .where("s.id", steps_id)
        .orderBy("st.id")
}


//<:<:<:<:<:<: POST :>:>:>:>:>:>\\

function add(scheme) {
    // const [id] = await db("scheme").insert(scheme)
    // return findById(id)
    return db("schemes")
        .insert(scheme, "id")
        .then(ids => {
            return findById(ids[0])
        })
}

function addStep(step) {
    return db("steps")
        .insert(step, "id")
        .then(ids => {
            return findSteps(ids[0])
        })
}

//<:<:<:<:<:<: PUT :>:>:>:>:>:>\\
function update(changes, id) {
    return db("schemes")
        .where({ id })
        .update(changes)
        .then(() => {
            return findById(id);
        });
}

//<:<:<:<:<:<: DELETE :>:>:>:>:>:>\\
function remove(id) {
    return db("schemes")
    .where({ id })
    .del()
}