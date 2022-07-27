import React, { useState } from "react";
import ModalUserEdit from '../../components/ModalUserEdit'
import { render, cleanup, fireEvent, act, waitFor, screen } from "@testing-library/react";
import jsonPainator from '../mock/responsePaginator.json';
import AxiosMockAdapter from "axios-mock-adapter";
import axios from 'axios';

describe("Testing ModalUsers", () => {
    let mock = new AxiosMockAdapter(axios);
    beforeAll(() => {
        let urlMock = 'https://rest-api-9938.herokuapp.com/api/users';
        const paginator = jsonPainator;
        mock.onGet(urlMock).reply(200, paginator);
    })
    it("Render ModalUsers", async () => {
        render(<ModalUserEdit />)
    })

    it("Apis ModalUsers", async () => {
        await act(async () => {
            render(<ModalUserEdit setopenModal={() => { }} openModal={false} setdataSet={() => { }} dataSet={() => { }} setvalidationService={() => { }} />)
        })
        // await waitFor(() => {
        //     screen.debug()
        //     expect(screen.getByText('Actualización de usuario')).toBeInTheDocument()
        // })
    })
})