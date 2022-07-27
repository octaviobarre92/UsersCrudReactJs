import React from "react";
import jsonPainator from '../mock/responsePaginator.json';
import AxiosMockAdapter from "axios-mock-adapter";
import axios from 'axios';
import { renderHook, act } from "@testing-library/react-hooks";
import useUsers from "../../hooks/useUsers";

describe("Testing Hook", () => {
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

    it("useUsers", async () => {
        let urlMock = 'https://rest-api-9938.herokuapp.com/api/users';
        const paginator = jsonPainator;
        mock.onGet(urlMock).reply(200, paginator);
        const { result, waitForNextUpdate } = renderHook(() => useUsers());
        await act(async () => {
            await waitForNextUpdate();
        });
        expect(result.current.users).toEqual(paginator);
        console.log("test", result.current);
    })
})