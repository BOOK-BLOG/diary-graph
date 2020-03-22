import React from 'react';
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import ExploreContainer from '../components/ExploreContainer';
import './MemoriesPage.css';

const MemoriesPage: React.FC = () => {
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Memories</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Memories</IonTitle>
          </IonToolbar>
        </IonHeader>
        <ExploreContainer name="MemoriesPage" />
      </IonContent>
    </IonPage>
  );
};

export default MemoriesPage;
