const { Client } = require('pg')
 
const config = {
  host: 'localhost',
  port: 5432,
  database: 'fd_test',
  user: 'postgres',
  password: '1234',
};

const loadUsers = async () => {
    const res = await fetch('https://randomuser.me/api/?seed=fdpg&results=100&nat=gb&page=7')
    const data = await res.json();
    return data.results;
}

const mapUsers = (users) => users.map(({name:{first, last}, email, gender, dob: {date}}) => 
`('${first}','${last}','${email}','${gender === 'male'}','${date}','${(Math.random()+1.2).toFixed(2)}')`)
.join(",");

const client = new Client(config) 
start();

async function start() {
    await client.connect();
    const users = await loadUsers();
    const res = await client.query(`
        INSERT INTO users(first_name, last_name, email, is_male, birthday, height)
        VALUES ${mapUsers(users)};
    `);
    console.log(res);

    await client.end();
}