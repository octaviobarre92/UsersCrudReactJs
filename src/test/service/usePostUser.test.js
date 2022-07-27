import React from "react";
import jsonPainator from '../mock/responsePaginator.json';
import AxiosMockAdapter from "axios-mock-adapter";
import axios from 'axios';


describe("Testing Api", () => {
    let mock;

    beforeAll(() => {
        mock = new AxiosMockAdapter(axios);
    });

    beforeEach(() => {
        jest.resetAllMocks();
    });

    afterEach(() => {
        mock.reset();
    });

    it("Test paginator", async () => {
        let urlMock = 'https://rest-api-9938.herokuapp.com/api/users';
        const paginator = jsonPainator;
        mock.onGet(urlMock).reply(200, paginator);

        let result = await axios.get(urlMock);

        expect(mock.history.get[0].url).toEqual(urlMock);
        expect(result.data).toEqual(paginator);
    })
})