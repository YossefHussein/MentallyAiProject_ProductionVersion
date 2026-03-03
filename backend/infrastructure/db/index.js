// this is import pg package and make Destructuring object and assign pg to pool
import pg from "pg";
const { Pool } = pg;
// and this is configuration of database by pool object
const pool = new Pool({
  user: process.env.pgUser,
  password: process.env.pgPassword,
  host: process.env.pHost,
  port: process.env.pgPort,
  database: process.env.pgDataBase,
});

export default {
  // this to make query from pool
  query: (text, params) => pool.query(text, params),
};
