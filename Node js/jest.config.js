module.exports={
    transform:{
         "^.+\\.ts$":"ts-jest"
    },
    testEnvironment:'node',
    testMatch:["**/test/*.test.ts"],
    moduleFileEstentions:["js","ts"]
}