import {
  useState,
  cloneElement
} from 'react'

import {
  Container,
  Step,
  Stepper,
  StepLabel,
  Box,
  Grid
} from '@mui/material'


import Form1 from './components/Form1'
import Form2 from './components/Form2'
import TableData from './components/Table'
import LoadingOverlay from 'react-loading-overlay'
import './css/custom.scss';

const App = () => {
  const [step, setStep] = useState(0)
  const [jsonUser, setjsonUser] = useState({})
  const [validationService, setvalidationService] = useState(true)
  const steps = [
    {
      label: 'Paso 1',
      componente: <Form1 setjsonUser={setjsonUser} jsonUser={jsonUser} setvalidationService={setvalidationService} validationService={validationService} setStep={setStep} />
    },
    {
      label: 'Paso 2',
      componente: <Form2 setjsonUser={setjsonUser} jsonUser={jsonUser} setvalidationService={setvalidationService} validationService={validationService} setStep={setStep} />
    }
  ]

  return (
    <Container
      fixed
      style={{
        padding: '3em'
      }}
    >
      <Grid
        container
        spacing={6}
      >
        <Grid
          item
          md={4}
          sm={12}
          xs={12}
        >
          <Stepper
            activeStep={step}
          >
            {steps.map((step, key) => (
              <Step
                key={key}
              >
                <StepLabel>
                  {step.label}
                </StepLabel>
              </Step>
            ))}
          </Stepper>
          <Box
            style={{
              marginTop: '4em'
            }}
          >
            {steps[step].componente}
          </Box>
        </Grid>
        <Grid
          item
          md={8}
          sm={12}
          xs={12}
        >
          <LoadingOverlay active={!validationService} spinner text={("Procesando informacion, espere por favor..")}>
           {validationService&&<TableData validationService={validationService} setvalidationService={setvalidationService} />}
          </LoadingOverlay>
        </Grid>
      </Grid>
    </Container>
  )
}

export default App
