import React, { useState } from "react";
import TableData from '../../components/Table'
import { render, cleanup, fireEvent, act, waitFor, screen } from "@testing-library/react";
import jsonPainator from '../mock/responsePaginator.json';
import AxiosMockAdapter from "axios-mock-adapter";
import axios from 'axios';

describe("Testing Table", () => {
    let mock = new AxiosMockAdapter(axios);
    beforeAll(() => {
        let urlMock = 'https://rest-api-9938.herokuapp.com/api/users';
        const paginator = jsonPainator;
        mock.onGet(urlMock).reply(200, paginator);
    })
    it("Render table", async () => {
        render(<TableData />)
    })

    it("Apis table", async () => {
        await act(async () => { render(<TableData setvalidationService={()=>{}} validationService={false} />) })
        await waitFor(() => {
            screen.debug()
            expect(screen.getByText('Acciones')).toBeInTheDocument()
        })
    })
})